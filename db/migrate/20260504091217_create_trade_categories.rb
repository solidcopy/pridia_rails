class CreateTradeCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :trade_categories do |t|
      t.string :name, null: false, limit: 100, comment: '名前'
      t.references :parent, null: true, foreign_key: { to_table: :trade_categories }, comment: '親'

      t.timestamps
    end

    add_reference :trades, :trade_category, foreign_key: true
  end
end
