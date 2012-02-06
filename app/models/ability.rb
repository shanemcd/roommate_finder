class Ability
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= User.new
    can :read, Listing
    can :create, Listing
    can :manage, Listing, :user_id => current_user.id
    can :manage, User, :user_id => current_user.id
    can :manage, Profile, :user_id => current_user.id
  end

end
