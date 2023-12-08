class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.buyer?
      can :read, Product
      can :buy, Product
      can :search, Product
    elsif user.seller?
      can :manage, Product, user_id: user.id
      cannot :search, Product
      cannot :manage, Cart
    else
      can :search, Product
    end
  end
end
