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
      cannot :buy, Product
      cannot :manage, Cart

    elsif user.admin?
      can :manage [User, Product]

    else
      can :search, Product
    end
  end
end
