class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one :cart, dependent: :destroy
    has_many :products, dependent: :destroy
    # has_many :cart_products

    has_one :company_detail, dependent: :destroy
    has_one :profile, dependent: :destroy


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

    validates :password, length: { minimum: 8, maximum: 8} 
    validate :password_complexity
    validates :email, :role, presence: true

    private
  
    def password_complexity
      return if password.blank? || password =~ /^(?=.*[[:punct:]])(?=.*[[:upper:]])(?=.*[[:lower:]])(?=.*[[:digit:]])/
  
      errors.add(:password, 'must contain at least one special character, one uppercase letter, one lowercase letter, and one digit')
    end

    def default_address
      user_addresses.find_by(is_default: true)
    end

  scope :sellers, -> { where(role: 'seller') }
  scope :buyers, -> { where(role: 'buyer') }


end
