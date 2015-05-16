class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :quantity
      t.string :size

      t.timestamps null: false
    end
  end
end
