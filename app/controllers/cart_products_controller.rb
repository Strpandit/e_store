class CartProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    if @cart_products = current_user.cart.cart_products.all

    else
      redirect_to products_path
    end
  end
  
  def new
    @product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.create_cart
    @cart_product = @cart.cart_products.find_or_initialize_by(product_id: @product.id)
    if @cart_product.new_record?
      @cart_product.quantity = 1
    else
      @cart_product.quantity
    end
    if @cart_product.save
      redirect_to cart_products_path, notice: 'Product added to cart!'
    else
      redirect_to root_path, alert: 'Failed to add product to cart!'
    end
  end


  def update
    
    @cart_product = CartProduct.find(params[:id])
    # quantity = @cart_product.quantity

    if params[:adjust] == "+"
      @cart_product.quantity += 1
      
    elsif params[:adjust] == "-" && @cart_product.quantity > 1
      @cart_product.quantity -= 1
     

    end

   
    if @cart_product.save
      # Handle successful quantity update
      flash[:success] = "Quantity updated successfully."  
    else
      # Handle errors if the quantity update fails
      flash[:error] = "Failed to update quantity."
    end
    redirect_to cart_products_path
  end















  def destroy
    @cart_product = current_user.cart.cart_products.find_by(id: params[:id])
    if @cart_product.present?
      @cart_product.destroy
      redirect_to cart_products_path, notice: 'Product was successfully removed from cart.'
    else
      redirect_to cart_products_path, alert: 'Product not found in cart.'
    end
  end

end