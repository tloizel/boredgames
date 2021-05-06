class ReviewPolicy < ApplicationPolicy
    def new?
      true
    end
  
    def create?
      User.find(Purchase.find(record.purchase_id).user.id) == user
    end
  end
  