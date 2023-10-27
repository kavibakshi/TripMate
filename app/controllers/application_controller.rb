class ApplicationController < ActionController::Base
    before_action :set_current_user
    helper_method :current_user
  
    def set_current_user
      if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
      end

      # Redirect according to the user type that is logged in
      if current_user
        if current_user.admin?
          # Redirect admin users to the admin dashboard
          redirect_to admin_dashboard_path if request.original_fullpath == '/'
        else
          # Redirect non-admin users to the lists_path
          redirect_to lists_path if request.original_fullpath == '/'
        end
      end
    end
  
    def current_user
      Current.user
    end
  end
  