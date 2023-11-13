class ExpenseTrackersController < ApplicationController
    def index
        /@expense_trackers = ExpenseTracker.all/
    end

    def show
       / @expense_tracker = ExpenseTracker.find(params[:id])/
    end
end