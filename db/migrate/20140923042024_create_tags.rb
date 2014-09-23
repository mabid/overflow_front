class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :count
      t.text :stats

      t.timestamps
    end
  end
end