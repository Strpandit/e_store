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
      # @cart = Cart.find_by(id: params[:id])
      #   if @cart.present?
      #     pdf_view(@cart)
      #     generate_and_send_cart_pdf(@cart)
         
      #     redirect_to thank_you_cart_path, notice: 'Order Confirmed Successfully'
      #     @cart.destroy
      #   else
      #     redirect_to products_path, notice: 'Cart not found'
      #   end
        
          @cart = Cart.find_by(id: params[:id])
        
          if @cart.present?
            pdf_view(@cart)
            pdf_data = generate_and_send_cart_pdf(@cart)
        
            # Destroy the cart after generating the PDF
           
        
            # Redirect to the thank_you page with the PDF URL as a parameter
            @cart.destroy
            redirect_to thank_you_cart_path(pdf_url: pdf_data[:url]), notice: 'Order Confirmed Successfully'
          else
            redirect_to products_path, notice: 'Cart not found'
          end
    end

    def thank_you
      debugger
      @pdf_url = params[:pdf_url]
      # redirect_to thank_you_cart_path
    end


  
  def pdf_view(cart)
    @cart_products = cart.cart_products.includes(:product)
  end

 

  def generate_and_send_cart_pdf(cart)
    pdf_html = render_to_string(template: 'carts/pdf_view', layout: 'pdf_layout', locals: { cart: cart })
    pdf = PDFKit.new(pdf_html).to_pdf
  
    # Save the PDF temporarily or use a storage service like AWS S3
    pdf_file = Tempfile.new(["cart_contents", ".pdf"])
    pdf_file.binmode
    pdf_file.write(pdf)
    pdf_file.rewind
  
    # Return the URL to the saved PDF file
    { url: pdf_file.path }
    ensure
    # Ensure that the temporary file is closed and deleted
    pdf_file.close
    pdf_file.unlink
  end
  
  def set_cart
    @cart = current_user.cart
  end

end  