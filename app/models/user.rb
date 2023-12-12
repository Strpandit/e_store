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
      last_login_at.present? && last_login_at >= 30.days.ago
    end
  
 
    
    def buyer?
      role == 'buyer'
    end

    def seller?
      role == 'seller'
    end 

    def admin?
      role == 'admin'
    end

    validates :email, :role, presence: true

    def default_address
      user_addresses.find_by(is_default: true)
    end

  scope :sellers, -> { where(role: 'seller') }
  scope :buyers, -> { where(role: 'buyer') }

end
