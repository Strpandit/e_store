class CompanyDetail < ApplicationRecord
    belongs_to :user
    validates :company_name, :company_phone, :company_email, :company_address, presence: true
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :company_email, format: { with: EMAIL_REGEX }, uniqueness: true
    validates :company_phone, uniqueness: true,  length: { is: 10 } 
  
 validates :company_name, :company_phone, :company_email, :company_address, 
  presence: { message: "can't be blank" }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :company_email, format: { with: EMAIL_REGEX,
   message: "is not a valid email address" }, uniqueness: { message: "is already taken" }
   
  validates :company_phone, uniqueness: 
  { message: "is already taken" }, length: { is: 10, message: "must be 10 digits" }

end
