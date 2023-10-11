class AdminDashboardController < ApplicationController
    def view_all_users
        @users =  User.all
    end
end
