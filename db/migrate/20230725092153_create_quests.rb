class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.string :name
      t.text :description
      t.text :requirement
      t.string :location
      t.integer :reward
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
