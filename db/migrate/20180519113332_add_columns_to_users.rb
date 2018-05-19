class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :dog_name, :string
    add_column :users, :dog_kind, :string
    add_column :users, :is_male_dog, :boolean
    add_column :users, :location, :string
  end
end
