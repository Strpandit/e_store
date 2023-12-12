class CreateUserAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_addresses do |t|
      t.string :address_name
      t.integer :address_contact_number
      t.integer :pincode
      t.string :state
      t.text :address
      t.string :locality
      t.string :city
      t.boolean :is_default, default: false, limit: 1
      t.boolean :is_primary, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
