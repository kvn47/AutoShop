class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: {to_table: :users}
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
