class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one :cart
    has_many :products
    # has_many :cart_products
    has_one :company_detail
    has_one :profile
    has_many :user_addresses

    def active?
      # Replace this with your logic to determine user activity status
      # For example, checking last login time or other activity indicators
      # This method should return true for active users and false for inactive ones
      # Example: Consider a scenario where a user is inactive if they haven't logged in for 30 days
      last_login_at.present? && last_login_at >= 30.days.ago
    end
  
 
    
    def buyer?
      role == 'buyer'
    end

    def seller?
      role == 'seller'
    end

    validates :email, :role, presence: true

    def default_address
      user_addresses.find_by(is_default: true)
    end
end
