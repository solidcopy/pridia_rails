class Trade < ApplicationRecord
  belongs_to :category, class_name: 'TradeCategory', foreign_key: :trade_category_id, optional: true
end
