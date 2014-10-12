class CreateTagEmrs < ActiveRecord::Migration
  def change
    create_table :tag_emrs do |t|
      t.integer :count
      t.string :name
      t.text :stats

      t.timestamps
    end
  end
end
