module UserAddressesHelper
    def current_user_addresses
        if current_user.present? # Check if a user is logged in
          current_user.user_addresses # Assuming User has_many :user_addresses association
          # Or perform the logic to retrieve user addresses based on current_user
        else
          # Return default or empty addresses if no user is logged i
        end
      end
end
