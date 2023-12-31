class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :role
      t.text :profile
      t.integer :purse, default: 0

      t.timestamps
    end
  end
end
