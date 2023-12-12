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

    
    def buyer?
      role == 'buyer'
    end

    def seller?
      role == 'seller'
    end

    validates :password, length: { minimum: 8, maximum: 8} 
    validate :password_complexity
    validates :email, :role, presence: true

    private
  
    def password_complexity
      return if password.blank? || password =~ /^(?=.*[[:punct:]])(?=.*[[:upper:]])(?=.*[[:lower:]])(?=.*[[:digit:]])/
  
      errors.add(:password, 'must contain at least one special character, one uppercase letter, one lowercase letter, and one digit')
    end
end
