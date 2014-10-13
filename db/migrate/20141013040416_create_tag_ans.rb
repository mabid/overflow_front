class CreateTagAns < ActiveRecord::Migration
  def change
    create_table :tag_ans do |t|
      t.string :name
      t.text :data
      t.string :date

      t.timestamps
    end
  end
end
