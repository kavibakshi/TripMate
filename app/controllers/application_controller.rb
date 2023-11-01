class ApplicationController < ActionController::Base
    before_action :set_current_user
    helper_method :current_user
  
    def set_current_user
      if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
      end

      # Redirect according to the user type that is logged in
      if current_user
        # Fetching the user's associated workspaces
        @workspaces = Current.user.workspaces
        if current_user.admin?
          # Redirect admin users to the admin dashboard
          redirect_to admin_dashboard_path if request.original_fullpath == '/'
        else
          # Check if the user has an associated workspace
          if @workspaces.exists?
            # Redirect non-admin users to the workspace's index action if accessing root path
            redirect_to workspaces_path if request.original_fullpath == '/'
          else
            # Handle scenario where user has no associated workspace
            # Example: Redirect them to a page where they can create a workspace or display a message
            redirect_to new_workspace_path if request.original_fullpath == '/'
          end
        end
      end
    end
  
    def current_user
      Current.user
    end
  end
  