class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :street1, :string
    remove_column :users, :street2, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :zip, :integer
  end
end
