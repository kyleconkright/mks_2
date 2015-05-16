class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
