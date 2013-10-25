class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: :non_member)

    if user.role.admin?
      can :manage, :all
    elsif user.role.member?
      can :read, Topic
    else
      can :read, Topic, visible: 'public'
    end
  end
end
