class TradeCategory < ApplicationRecord
  belongs_to :parent, class_name: 'TradeCategory', optional: true
  has_many :children, class_name: 'TradeCategory', foreign_key: :parent_id, dependent: :nullify
end
