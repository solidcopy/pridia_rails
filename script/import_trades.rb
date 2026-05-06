require 'csv'

FILEPATH = 'data/購買記録.csv'

category_caches = {}

ActiveRecord::Base.transaction do
  Trade.update_all(trade_category_id: nil)
  TradeCategory.delete_all

  preset_categories = %w[Steam Kindle まんが王国 iOSアプリ Androidアプリ ふるさと納税 Udemy mora e-onkyo iTunes Xbox360 Wii]
  preset_categories.each do |category|
    next if TradeCategory.find_by(name: category).present?

    trade_category = TradeCategory.create!(name: category)
    category_caches[category] = trade_category
  end

  Trade.delete_all

  CSV.foreach(FILEPATH, headers: :first_row) do |line|
    trade = Trade.new

    begin
    trade.date = Date.parse(line[0])
    rescue Date::Error => e
      puts "Invalid Date Format: #{line[0]}"
      raise e
    end
    trade.item = line[1]
    trade.quantity = line[2].blank? ? 1 : line[2].to_i
    trade.price = line[3].blank? ? 0 : line[3].to_i

    remarks = line[4]
    if !remarks.blank?
      cache = category_caches[remarks]
      if !cache.nil?
        trade.category = cache
      else
        category = TradeCategory.find_by(name: remarks)
        if !category.nil?
          category_caches[remarks] = category
          trade.category = category
        else
          trade.remarks = remarks
        end
      end
    end

    trade.save!
  end
end
