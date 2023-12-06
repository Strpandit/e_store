class CartsController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @cart = current_user.cart
      if @cart.present?
        @cart_products = @cart.cart_products.includes(:product)
        # redirect_to cart_path
      else
        redirect_to products_path
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