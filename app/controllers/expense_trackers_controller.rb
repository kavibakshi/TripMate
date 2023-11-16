class ExpenseTrackersController < ApplicationController
    before_action :set_expense_lists_with_id, only: [:edit, :update, :destroy, :show]
    before_action :get_itinerary_tuple, only: [:new]

    def index
        @expense_lists = ExpenseTracker
        .joins("inner join itineraries on itineraries.id = expense_trackers.itinerary_id")
        .select("expense_trackers.id, expense_trackers.total_budget, expense_trackers.itinerary_id, expense_trackers.accommodation, expense_trackers.transportation, expense_trackers.meal, expense_trackers.other, itineraries.description")
        .order("expense_trackers.itinerary_id ASC")
    end

    def show
    end

    def new
        @expense_lists = ExpenseTracker.new
    end

    def edit
    end

    def update
        if @expense_lists.update(expense_params)
            redirect_to @expense_lists, notice: "The Expense Details were saved successfully."
        else
            render :edit
        end
    end

    def create
        @expense_lists = ExpenseTracker.new(expense_params)
        if @expense_lists.save
            redirect_to expense_trackers_path, notice: "The Expense Details were saved successfully."
        else
            render :new
        end
    end

    def destroy
        @expense_lists.destroy
        redirect_to expense_trackers_path, notice: "Successfully removed Expense ID #{@expense_lists.id}"
    end

    private
    def set_expense_lists_with_id
        @expense_lists = ExpenseTracker
        .joins("inner join itineraries on itineraries.id = expense_trackers.itinerary_id")
        .select("expense_trackers.id, expense_trackers.total_budget, expense_trackers.itinerary_id, expense_trackers.accommodation, expense_trackers.transportation, expense_trackers.meal, expense_trackers.other, itineraries.description")
        .order("expense_trackers.itinerary_id ASC").find(params[:id])
    end

    def get_itinerary_tuple
        @itineraries_tuple = Itinerary.all.select('id, description').order("id ASC")
    end

    def expense_params
        params.require(:expense_tracker).permit(:total_budget, :itinerary_id, :itinerary_description, :accommodation, :transportation, :meal, :other)
    end
end