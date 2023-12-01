# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.buyer?
      can :read, Product
      can :buy, Product
    elsif user.seller?
      can :create, Product
    end
  end
end
