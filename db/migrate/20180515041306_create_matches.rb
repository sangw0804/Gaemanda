class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :user1
      t.integer :user2

      t.timestamps
    end
  end
end
