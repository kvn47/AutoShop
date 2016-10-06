class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.integer :group, null: false
      t.string :name, null: false
      t.money :price

      t.timestamps
    end
  end
end
