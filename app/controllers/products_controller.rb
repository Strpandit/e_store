class ProductsController < ApplicationController
  require 'roo'
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
      if params[:product].present?
        @results = Product.where('name LIKE ?', "%#{@product}%")
      else
        @products = []
      end
      # redirect_to search_products_path
    end

    # def upload_excel
    #   if params[:product].present? && params[:product][:excel_file].present?
    #     @product = Product.new(product_params)
    #     @product.save
    #     redirect_to upload_excel_products_path, notice: 'Product and Excel file uploaded successfully.'
    #   else
    #     redirect_to products_path, alert: 'Please select a file to upload.'
    #   end
    # end
  
    # def download_excel
    #   @products = Product.all
    #   respond_to do |format|
    #     format.xlsx do
    #       send_data generate_excel(@products),
    #                 filename: 'products.xlsx',
    #                 type: Mime[:xlsx] # Use Mime[:xlsx] for clarity and safety
    #     end
    #   end
    # end

    def import
      Product.import(params[:file])
      redirect_to root_path
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :description, :price,:user_id,:image, :category_id, :subcategory_id)
    end

    # def generate_excel(products)
    #   Axlsx::Package.new do |p|
    #     p.workbook.add_worksheet(name: 'Products') do |sheet|
    #       sheet.add_row ['Name', 'Description', 'Price']
  
    #       @products.each do |product|
    #         sheet.add_row [product.name, product.description, product.price]
    #       end
    #     end
    #   end.to_stream.string
    # end

end
  