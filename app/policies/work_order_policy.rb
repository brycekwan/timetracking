class WorkOrderPolicy < ApplicationPolicy
    attr_reader :user, :work_order
  
    def initialize(user, work_order)
      @user = user
      @work_order = work_order
    end


    class Scope < Scope
      def initialize(user, scope)
        @user  = user
        @scope = scope
      end
  
      def resolve
        if user.admin?
          scope.all
        else
          scope.where(user_id: user.id)
        end
      end
  
      private
  
      attr_reader :user, :scope
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
  end
  