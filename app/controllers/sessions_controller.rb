class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id

            if user.admin?
                #redirect to admin page if user is an admin
                redirect_to admin_dashboard_path, notice: "Logged in as Admin"
            else
                puts "User is not an admin: #{user.email}" # Add this line for debugging
                redirect_to root_path, notice: "Logged in successfully"
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

