class Product < ApplicationRecord
    belongs_to :user
    has_many :cart_products
    has_many :carts, through: :cart_products
    has_one_attached :image
  end
  