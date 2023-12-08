class Product < ApplicationRecord
    belongs_to :user
    has_many :cart_products
    has_many :carts, through: :cart_products
    has_one_attached :image
    belongs_to :category

    validates :name, presence: true, length: { maximum: 25 }
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :image, presence: true
  end
  