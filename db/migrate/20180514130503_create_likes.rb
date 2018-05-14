class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :liker
      t.integer :likee
      t.boolean :matched

      t.timestamps
    end
  end
end
