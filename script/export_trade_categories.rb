FILEPATH = 'data/trade_categories.lst'.freeze

File.open(FILEPATH, 'w') do |file|
  TradeCategory.all.each do |category|
    file << "#{category.name}<#{category.parents.map(&:name).join(',')}\n"
  end
end
