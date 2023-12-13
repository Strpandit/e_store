class UserAddressesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_address, only: [:show, :edit, :update, :destroy, :set_default, :set_primary]

    include UserAddressesHelper


    def index
      @user_addresses = current_user.user_addresses
        # redirect_to @user_addresses
     
       
    end
    def new
        @user_address=UserAddress.new
    end

    def create
      
       @user_address= current_user.user_addresses.new(user_address_params)
    
       if @user_address.save
        
           redirect_to user_addresses_path, notice: 'address was successfully created.'
       else
           render :new
       end
    end

    def show
        @user_address = UserAddress.find_by(id: params[:id])
        unless @user_address
          flash[:error] = "Address not found"
          redirect_to @user_addresses # Redirect to an appropriate path when address is not found
          return
        end
        render 'show' # Replace 'show' with your view name
      end
  
    def edit
      @user_address = current_user.user_addresses.find(params[:id])
    end

    def update
        @user_address = current_user.user_addresses.find_by(id: params[:id])
            if @user_address.update(user_address_params)
              redirect_to user_addresses_path
            else
            render :edit, notice: 'Profile updated successfully.'
            end
         end

    def destroy
        @user_address = UserAddress.find_by(id: params[:id])
          if @user_address.present?
            @user_address.destroy
            redirect_to user_addresses_path, notice: ' Confirmed Successfully'
          end
      end

      def set_default
        @user_address.set_as_default
        redirect_to user_addresses_path, notice: 'Address set as default.'
      end
  
      def set_primary
        @user_address.set_as_primary
        redirect_to user_addresses_path, notice: 'Address set as primary.'
      end
 


    private
    def set_address
      @user_address = current_user.user_addresses.find(params[:id])
    end
  

    def user_address_params
        params.require(:user_address).permit(:address_name, :address_contact_number, :pincode,:address, :state,:locality,:city, :is_default, :is_primary)
    end

  end
