class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :level, :string
    add_column :users, :abilities, :string
    add_column :users, :character_class, :string
    add_column :users, :stats, :jsonb
  end
end
