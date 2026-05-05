class CreateTrades < ActiveRecord::Migration[8.1]
  def change
    create_table :trades do |t|
      t.date :date, null: false, comment: '日付'
      t.string :item, null: false, limit: 1000, comment: '品目'
      t.integer :quantity, null: false, default: 1, limit: 1, comment: '数量'
      t.integer :price, null: false, limit: 4, comment: '金額'
      t.string :remarks, limit: 1000, comment: '備考'

      t.timestamps
    end
  end
end
