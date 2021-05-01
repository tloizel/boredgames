class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(active: false, user: user)
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def dashboard?
    return true
  end

  def purchase?
    return true if record.active && record.user != user
  end

end
