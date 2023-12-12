class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protect_from_forgery with: :exception
    helper_method :current_user_cart_products_count
    def current_user_cart_products_count
      # Fetching the current user's cart and counting the cart_products
      @current_user_cart_products_count ||= current_user.cart&.cart_products&.count || 0
    end

    def after_sign_in_path_for(resource)
      if resource.seller?
        root_path
      elsif resource.buyer?
        products_path
      elsif resource.admin?
        root_path
      else
        super
      end
    end

    def after_sign_up_path_for(resource)
        new_user_session_path 
    end

    def after_sign_out_path_for(resource_or_scope)
        root_path 
    end

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, alert: exception.message
      end
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:current_password, :password, :password_confirmation])
    end

  end
  