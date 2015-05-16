class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :address, index: true, foreign_key: true
  end
end
