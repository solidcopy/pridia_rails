class TradeCategory < ApplicationRecord
  has_many :parent_inheritances, class_name: 'TradeCategoryInheritance', foreign_key: :child_id, dependent: :destroy
  has_many :parents, through: :parent_inheritances, source: :parent

  has_many :child_inheritances, class_name: 'TradeCategoryInheritance', foreign_key: :parent_id, dependent: :destroy
  has_many :children, through: :child_inheritances, source: :child
end
