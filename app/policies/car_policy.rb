class CarPolicy < ApplicationPolicy
  # attr_reader :user, :record
  #
  # def initialize(user, record)
  #   @user = user
  #   @record = record
  # end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def show_destroy_link?
    user.admin? || true
  end

  def destroy?
    user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
