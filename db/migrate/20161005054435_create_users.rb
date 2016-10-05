class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end
  end
end
