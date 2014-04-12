class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :index, User
      can [:show, :edit, :update, :destroy], User, :id => user.id

      can [:index, :edit, :update, :destroy], Template, :user_id => user.id
      can :new, Template
    end
    can :show, Template
  end

end
