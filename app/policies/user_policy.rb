class UserPolicy < ApplicationPolicy
  attr_reader :record, :user

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end

    def admin?
      user.role.in?(["Admin","Owner"])
    end
  end

  def initialize(user, record) # curren_user and object, whose authorization is checked
    @record = record
    @user = user
  end

  def new?
    admin?
  end
  
  def create?
    if record_is_admin?
      owner_role?
    else
      admin?
    end
  end

  def show?
    admin? || current_user?
  end

  def edit?
    admin? || current_user?
  end

  def update?
    if record_is_admin?
      owner_role?
    else
      admin? || current_user?
    end
  end

  def owner_role?
    user.role.in?(["Owner"])
  end

  def admin_role?
    user.role.in?(["Admin"])
  end

  def destroy?
    if !record_is_owner?
      admin?
    end
  end

  def admin?
    user.role.in?(["Admin","Owner"]) if user
  end

  def record_is_admin?
    record.role.in?(["Admin","Owner"]) if record
  end

  def record_is_owner?
    record.role.in?(["Owner"]) if record
  end

  def current_user?
    record.id == user.id if user
  end

  def permitted_attributes
    if admin?
      [:name, :role, :email, :password, :password_confirmation, :old_password]
    else
      [:email, :password, :password_confirmation, :old_password]
    end
  end

end