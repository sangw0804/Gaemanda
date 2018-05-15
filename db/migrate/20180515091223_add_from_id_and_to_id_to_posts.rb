class AddFromIdAndToIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :from_id, :integer
    add_column :posts, :to_id, :integer
  end
end
