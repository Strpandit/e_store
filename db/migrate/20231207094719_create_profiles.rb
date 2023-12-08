class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :address
      t.integer :gender
      t.integer :contact_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
