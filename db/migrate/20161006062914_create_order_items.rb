class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, index: true, foreign_key: true
      t.references :component, null: false, index: true, foreign_key: true
      t.money :price, null: false

      t.timestamps
    end
  end
end
