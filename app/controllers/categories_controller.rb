class CategoriesController < ApplicationController
    respond_to :html, :json
    before_action :authenticate_user!, except: [:clothing, :book, :bag, :watch, :footwear, :electronic]
    # load_and_authorize_resource

    def get_sub_category
      if params[:category_id]
        @sub_categories = Subcategory.where(category_id: params[:category_id])
      else
        @sub_categories = Subcategory.all
      end
    end

    def clothing
      @category = Category.find_by(name: "Clothing")
      @products = @category.products
    end

    def book
      @category = Category.find_by(name: "Book")
      @products = @category.products
    end

    def bag
      @category = Category.find_by(name: "Bag")
      @products = @category.products
    end

    def electronic
      @category = Category.find_by(name: "Electronics")
      @products = @category.products
    end

    def footwear
      @category = Category.find_by(name: "Footwear")
      @products = @category.products
    end

    def watch
      @category = Category.find_by(name: "Watch")
      @products = @category.products
    end

end
