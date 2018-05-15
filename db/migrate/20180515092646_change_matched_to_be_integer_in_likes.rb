class ChangeMatchedToBeIntegerInLikes < ActiveRecord::Migration[5.1]
  def change
    change_column :likes, :matched, :integer
  end
end
