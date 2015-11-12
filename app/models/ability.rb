class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    denny_all_profile

    if user.moderator?
      allow_moderator_profile
    elsif user.admin?
      allow_admin_profile
    else
      allow_registered_profile
    end
  end

  private

  def denny_all_profile
    cannot :manage, :all
  end

  def allow_registered_profile
    can [:read, :update], [Branch]
  end

  def allow_moderator_profile
    allow_registered_profile
    can [:read, :create, :update], [User, Branch]
  end

  def allow_admin_profile
    can :manage, :all
  end
end
