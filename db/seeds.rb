# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.create( email: 'user1@example.com', password: 'password', role: 'buyer')
user2 = User.create( email: 'user2@example.com', password: 'password', role: 'seller')

product1 = Product.create(name: 'Product 1', description:"abchsghgsh", price: 19.99, user_id:1)
product2 = Product.create(name: 'Product 2', description:"abchsghgsh", price: 29.99, user_id:2)
product3 = Product.create(name: 'Product 3', description:"abchsghgsh", price: 39.99, user_id:2)

cart_p = CartProduct.create(cart_id: 1, product_id: 2 , quantity: 2)