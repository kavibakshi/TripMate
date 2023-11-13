class UsersController < ApplicationController
    # GET /users
    def index
        @users = User.all
    end

    # GET /users/1 
    def show
    end

    # GET /users/1/edit
    def edit
    end

    # DELETE /lists/1 or /lists/1.json
    def destroy
        @user = User.find(params[:id])
        @user.destroy

        respond_to do |format|
        format.html { redirect_to admin_dashboard_url, notice: "User was successfully deleted." }
        format.json { head :no_content }
        end
    end
end