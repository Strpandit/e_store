class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:show, :pdf_view]
  
  include UserAddressesHelper

  def show
    @cart = current_user.cart
    if @cart.present?
      @cart_products = @cart.cart_products.includes(:product)
      @user_addresses = current_user_addresses
    else
      # redirect_to products_path
    end
  end

  def destroy
    @cart = Cart.find_by(id: params[:id])
    if @cart.present?
      
      pdf = generate_and_send_cart_pdf(@cart)
      CartMailer.send_cart_email(current_user.email, pdf).deliver_later

      # send_data(pdf, filename: 'invoice.pdf', type: 'application/pdf', disposition: 'attachment') # Download invoice

      @cart.destroy 
      # Destroy cart data after invoice sent
      redirect_to thank_you_cart_path, notice: 'Order Confirmed Successfully'
    else
      redirect_to products_path, notice: 'Cart not found'
    end
  end
  
  def pdf_view(cart)
    @cart_products = cart.cart_products.includes(:product)
  end

  def thank_you 
    # Action for rendering the thank you page
  end

  def generate_and_send_cart_pdf(cart)
    pdf_view(@cart)
    pdf_html = render_to_string(template: 'carts/pdf_view', layout: 'pdf_layout', locals: { cart: cart })

    PDFKit.new(pdf_html).to_pdf
   
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
