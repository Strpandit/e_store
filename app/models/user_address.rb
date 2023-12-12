class UserAddress < ApplicationRecord
  belongs_to :user


  validates :address_name, presence: { message: "Please provide an address name" }
  validates :address_contact_number, presence: { message: "Please provide a contact number" },
                                    numericality: { only_integer: true, message: "Contact number should be numerical" },
                                    length: { is: 10, message: "Contact number should be 10 digits long" }
  validates :pincode, presence: { message: "Please provide a pincode" },
                      numericality: { only_integer: true, message: "Pincode should be numerical" },
                      length: { is: 6, message: "Pincode should be 6 digits long" }
  validates :state, presence: { message: "Please provide a state" }
  validates :address, presence: { message: "Please provide an address" }
  validates :locality, presence: { message: "Please provide a locality" }
  validates :city, presence: { message: "Please provide a city" }

  


  before_save :check_default_primary_user_address

  def set_as_default
    user.user_addresses.update_all(is_default: false)
    update(is_default: true)
  end

  def set_as_primary
    user.user_addresses.update_all(is_primary: false)
    update(is_primary: true)
  end

  # def set_as_default
  #   user.user_addresses.new(is_default: false)
  #   create(is_default: true)
  # end

  # def set_as_primary
  #   user.user_addresses.new(is_primary: false)
  #   create(is_primary: true)
  # end



  # validate :only_one_default_address, if: :is_default_changed?

  private

  # def set_as_default(user)
  #   user.user_addresses.update_all(is_default: false) # Set all addresses as non-default
  #   update(is_default: true) # Set this address as default
  # end


  def check_default_primary_user_address
    if self.is_default?
      user.user_addresses.where.not(id: self.id).update_all(is_default: false)
    end

    if self.is_primary?
      user.user_addresses.where.not(id: self.id).update_all(is_primary: false)
    end
  end

end


