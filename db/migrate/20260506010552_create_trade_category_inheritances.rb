class CreateTradeCategoryInheritances < ActiveRecord::Migration[8.1]
  def change
    create_table :trade_category_inheritances do |t|
      t.references :parent, null: false, foreign_key: { to_table: :trade_categories }
      t.references :child, null: false, foreign_key: { to_table: :trade_categories }

      t.timestamps
    end

    add_index :trade_category_inheritances, %i[parent_id child_id], unique: true
  end
end
