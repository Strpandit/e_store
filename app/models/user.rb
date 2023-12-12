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
    
  #   def user_signed_in?(user)
  #   user.current_sign_in_at.present?
  #  end
  scope :sellers, -> { where(role: 'seller') }
  scope :buyers, -> { where(role: 'buyer') }

end
