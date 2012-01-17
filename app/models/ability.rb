class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Listing
    can :create, Listing
    can :manage, Listing, :user_id => current_user.id
    can :manage, User, :user_id => current_user.id
  end

end
