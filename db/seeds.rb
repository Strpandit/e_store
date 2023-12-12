# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

electronics = Category.find_or_create_by(name: "Electronics")
clothings = Category.find_or_create_by(name: "Clothing")
footwears = Category.find_or_create_by(name: "Footwear")
watches = Category.find_or_create_by(name: "Watch")
bags = Category.find_or_create_by(name: "Bag")
books = Category.find_or_create_by(name: "Book")

laptops = electronics.subcategories.find_or_create_by(name: "Laptops")
smartphones = electronics.subcategories.find_or_create_by(name: "Smartphones")

shirts = clothings.subcategories.find_or_create_by(name: "Shirt")
tshirts = clothings.subcategories.find_or_create_by(name: "Tshirt")

shoes = footwears.subcategories.find_or_create_by(name: "Shoes")
flip_flops = footwears.subcategories.find_or_create_by(name: "Flip Flops")

digitalwatches = watches.subcategories.find_or_create_by(name: "Digital")
analogwatches = watches.subcategories.find_or_create_by(name: "Analog")

handbags = bags.subcategories.find_or_create_by(name: "Hand Bag")
schoolbags = bags.subcategories.find_or_create_by(name: "School Bag")

book1 = books.subcategories.find_or_create_by(name: "Spritual")
book2 = books.subcategories.find_or_create_by(name: "Comics")


admin = User.create(email: "admin@gmail.com", password:"Admin@12", role: "admin")