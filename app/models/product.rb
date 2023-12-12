class Product < ApplicationRecord
    belongs_to :user
    has_many :cart_products
    has_many :carts, through: :cart_products
    has_one_attached :image
    belongs_to :category

    

  validates :name, presence: { message: "Name can't be blank" }, length: { maximum: 25, message: "Name is too long (maximum is 25 characters)" }
  validates :description, presence: { message: "Description can't be blank" }
  validates :price, presence: { message: "Price can't be blank" }, numericality: { greater_than: 0, message: "Price must be greater than 0" }
  validates :image, presence: { message: "Image can't be blank" }


  end
  