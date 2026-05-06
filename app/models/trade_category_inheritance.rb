class TradeCategoryInheritance < ApplicationRecord
  belongs_to :parent, class_name: 'TradeCategory'
  belongs_to :child, class_name: 'TradeCategory'
end
