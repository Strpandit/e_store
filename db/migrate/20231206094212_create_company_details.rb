class CreateCompanyDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :company_details do |t|
      t.string :company_name
      t.string :company_email
      t.integer :company_phone
      t.text :company_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
