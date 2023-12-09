class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:search, :index]
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
        # redirect_to @product, notice: 'Product was successfully created.'
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show
      @product = Product.find_by(id: params[:id])
        # redirect_to product_path
    end

    def edit
      @product = Product.find_by(id: params[:id])
    end
    def update
      @product = Product.find_by(id: params[:id])
      if @product.present?
        @product.update(product_params)
         redirect_to root_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find_by(id: params[:id])
        if @product.present?
          @product.destroy
          redirect_to root_path, notice: ' Confirmed Successfully'
        end
    end
  
    def search
      @product = params[:product]
      @results = Product.where('name LIKE ?', "%#{@product}%")
      # redirect_to search_products_path
    end

    private
    
    def product_params
      params.require(:product).permit(:name, :description, :price,:user_id,:image, :category_id, :subcategory_id)
    end
  end
  