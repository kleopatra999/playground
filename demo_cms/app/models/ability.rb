class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: :non_member)

    if user.role.admin?
      can :manage, :all
    else
      can :read, Topic
    end
  end
end
