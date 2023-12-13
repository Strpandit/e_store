class Profile < ApplicationRecord
  belongs_to :user
  enum :gender,[:male, :female]

  validates :name, :gender, :address, :contact_number, presence: { message: "can't be blank" }

  validates :contact_number, uniqueness: { message: "should be unique" },
                             length: { is: 10, message: "should be 10 digits long" }
end
