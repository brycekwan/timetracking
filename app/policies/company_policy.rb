class CompanyPolicy < ApplicationPolicy
    attr_reader :user, :company
  
    def initialize(user, company)
      @user = user
      @company = company
    end
    
    def index?
      user.admin?
    end
  
    def show?
      user.admin?
    end
  
    def create?
      user.admin?
    end
  
    def new?
      user.admin?
    end
  
    def update?
      user.admin?
    end
  
    def edit?
      user.admin?
    end
  
    def destroy?
      user.admin?
    end
  
    class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    end
  end
  