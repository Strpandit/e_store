class CartsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cart, only: [:show, :pdf_view]

    def show
      @cart = current_user.cart
      if @cart.present?
        @cart_products = @cart.cart_products.includes(:product)
       
      else
        # redirect_to products_path
      end
    end


    
  
    def destroy
      @cart = Cart.find_by(id: params[:id])
        if @cart.present?
          pdf_view(@cart)
          generate_and_send_cart_pdf(@cart)
          @cart.destroy
          redirect_to thank_you_carts_path, notice: 'Order Confirmed Successfully'
          

          # redirect_to products_path, notice: 'Order Confirmed Successfully'
        else
          redirect_to products_path, notice: 'Cart not found'
        end
    end



  private
  def pdf_view(cart)
    @cart_products = cart.cart_products.includes(:product)
  end

  def thank_you
    render 'thank_you'

  end

  def generate_and_send_cart_pdf(cart)
    pdf_html = render_to_string(template: 'carts/pdf_view', layout: 'pdf_layout', locals: { cart: cart })

    pdf = PDFKit.new(pdf_html).to_pdf

    CartMailer.send_cart_email(current_user.email, pdf).deliver_later

    # send_data(pdf, filename: 'cart_contents.pdf', type: 'application/pdf', disposition: 'attachment')
  
  end
  def set_cart
    @cart = current_user.cart
  end

end  