class CartsController < ApplicationController
    before_action :authenticate_user!

    def show
        @cart = current_user.cart
        # @cart_items = @cart.cart_items.includes(:product)
    end
    
    def add_to_cart
        @product = Product.find(params[:product_id])
        current_user.cart.products << product
        redirect_to cart_path, notice: 'Product added to cart successfully.'
    end
    
    def remove_from_cart
        @product = Product.find(params[:product_id])
        current_user.cart.products.delete(product)
        redirect_to cart_path, notice: 'Product removed from cart successfully.'
    end
end
