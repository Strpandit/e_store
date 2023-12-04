class CartsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_cart
  
    def show
      @cart = current_user.cart
      if @cart.present?
        @cart_products = @cart.cart_products.includes(:product)
        # redirect_to cart_path
      else
        redirect_to products_path
      end
    end
  
    def add_to_cart
      product = Product.find(params[:product_id])
      quantity = params[:quantity].to_i
  
      if quantity.positive?
        existing_item = @cart.cart_products.find_by(product: product)
  
        if existing_item
          existing_item.update(quantity: existing_item.quantity + quantity)
        else
          @cart.cart_products.create(product: product, quantity: quantity)
        end
  
        redirect_to cart_path, notice: 'Product added to cart successfully.'
      else
        redirect_to product_path(product), alert: 'Invalid quantity.'
      end
    end
  
    def destroy
      @cart = Cart.find_by(id: params[:id])
        if @cart.present?
          @cart.destroy
          redirect_to cart_path, notice: 'Order Confirmed Successfully'
        end
    end

  

  end  