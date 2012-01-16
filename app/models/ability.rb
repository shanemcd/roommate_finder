class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Listing
    can :create, Listing
    can :destroy, Listing do |listing|
      listing.try(:user) == current_user
    end
  end

end
