class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    record.user == user || Transaction.where(offer_id: record.id).first.user_id == user 
  end

  def destroy?
    record.user == user
  end

  def dashboard?
    return true
  end
end
