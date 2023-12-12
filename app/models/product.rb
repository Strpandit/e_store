class Product < ApplicationRecord
  require "roo"
    belongs_to :user
    has_many :cart_products, dependent: :destroy
    has_many :carts, through: :cart_products, dependent: :destroy
    has_one_attached :image
    has_one_attached :file
    belongs_to :category

    validates :name, presence: true, length: { maximum: 25 }
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :image, presence: true


    def self.import(file)
      debugger
      xlsx = workbook = RubyXL::Parser.parse file
      # xlsx.each_row_streaming(offset: 1) do |row|
      #   @product = self.new(id: row[0].value, name: row[1].value, price: row[2].value)
      #   next if self.pluck(:id).include?(@product.id)
      #   @product.save
      # end
    end

    

  validates :name, presence: { message: "Name can't be blank" }, length: { maximum: 25, message: "Name is too long (maximum is 25 characters)" }
  validates :description, presence: { message: "Description can't be blank" }
  validates :price, presence: { message: "Price can't be blank" }, numericality: { greater_than: 0, message: "Price must be greater than 0" }
  validates :image, presence: { message: "Image can't be blank" }


  end
  