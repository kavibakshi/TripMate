class AdminDashboardController < ApplicationController
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
        @user.destroy

        respond_to do |format|
        format.html { redirect_to admin_dashboard_url, notice: "User was successfully deleted." }
        format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:description, :completed)
    end

end
