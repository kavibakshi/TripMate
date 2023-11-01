class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
  
        if user.admin?
          # Redirect to the admin dashboard if the user is an admin
          redirect_to admin_dashboard_path, notice: "Logged in as admin"
        else
          # Redirect non-admin users to the workspace creation/index page
        redirect_to workspaces_path, notice: "Logged in successfully"
        end
      else
        flash[:alert] = "Invalid email or password"
        render :new, status: 422
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged Out"
    end
  end
  