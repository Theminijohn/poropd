class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
      # can :manage, ActiveAdmin
    else
      can :read, :all
    end

  end
end
