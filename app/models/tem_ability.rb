class TeamAbility
  include CanCan::Ability

  def initialize(user, team, match)
    # Define abilities for the passed in user here. For example:
    #
      if user.admin
          can :manage match
       else
         if user.has_role?(:manager, team)
           if team.has_role?(:manager, match)
             can :manage, match
           end
         end
         can :read, match
       end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
