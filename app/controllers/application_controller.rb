class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :authenticate_user!, unless: :devise_controller?

end
