class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one :cart
    has_many :products
    # has_many :cart_products
    has_one :company_detail
<<<<<<< HEAD
=======
    has_one :profile
>>>>>>> Final ui
    
    def buyer?
      role == 'buyer'
    end

    def seller?
      role == 'seller'
    end

    validates :email, :role, presence: true
end
