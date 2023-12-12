class CartMailer < ApplicationMailer
    def send_cart_email(user_email, pdf)
        attachments['cart_contents.pdf'] = pdf
        mail(to: 'hr1@yopmail.com', subject: 'Your Cart Contents order')
    end
end
