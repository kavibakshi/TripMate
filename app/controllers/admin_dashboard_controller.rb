class AdminDashboardController < ApplicationController
    before_action :require_admin
  
    def index
      # Admin-specific logic here
    end
  
    private
  
    def require_admin
      unless current_user && current_user.admin?
        redirect_to root_path, alert: "Access denied. You are not an admin."
      end
    end
  end
  