class ProductsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
      @products = Product.all
      # redirect_to @product
    end

    def new
      @product = current_user.products.new
    end
  
    def create
      @product = current_user.products.new(product_params)
  
      if @product.save
        # redirect_path = current_user.seller? ? seller_dashboard_path : @product
        redirect_to @product, notice: 'Product was successfully created.'
        # redirect_to redirect_path
      else
        render :new
      end
    end
  
    def show
        @product = Product.find(params[:id])
        redirect_to @product
    end
  
    private
    
    def product_params
      params.require(:product).permit(:name, :description, :price,:user_id,:image)
    end
  end
  