class Profile < ApplicationRecord
  belongs_to :user
  enum :gender, [:male, :female]

  validates :name, :gender, :address, :contact_number, presence: true
  validates :contact_number, uniqueness: true,  length: { is: 10 }
end
