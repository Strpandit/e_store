# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

electronics = Category.create(name: "Electronics")
clothings = Category.create(name: "Clothing")
footwears = Category.create(name: "Footwear")
watches = Category.create(name: "Watch")
bags = Category.create(name: "Bag")
books = Category.create(name: "Book")

laptops = electronics.subcategories.create(name: "Laptops")
smartphones = electronics.subcategories.create(name: "Smartphones")

shirts = clothings.subcategories.create(name: "Shirt")
tshirts = clothings.subcategories.create(name: "Tshirt")

shoes = footwears.subcategories.create(name: "Shoes")
flip_flops = footwears.subcategories.create(name: "Flip Flops")

digitalwatches = watches.subcategories.create(name: "Digital")
analogwatches = watches.subcategories.create(name: "Analog")

handbags = bags.subcategories.create(name: "Hand Bag")
schoolbags = bags.subcategories.create(name: "School Bag")

book1 = books.subcategories.create(name: "Spritual")
book2 = books.subcategories.create(name: "Comics")
