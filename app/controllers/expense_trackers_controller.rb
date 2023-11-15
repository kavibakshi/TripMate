class ExpenseTrackersController < ApplicationController
    before_action :set_expense_tuple_with_id, only: [:edit, :update, :destroy, :show]
    before_action :get_itinerary_tuple, only: [:index, :edit, :new, :update, :create]
    
    def index
        @expense_lists = ExpenseTracker
        .joins("inner join itineraries on itineraries.id = expense_trackers.itineraries_id")
        .select("expense_trackers.id, expense_trackers.total_budget, expense_trackers.itineraries_id, expense_trackers.accommodation, expense_trackers.transportation, expense_trackers.meal, expense_trackers.other, expense_trackers.remaining_budget, itineraries.description")
        .order("expense_trackers.itineraries_id ASC")
    end

    def edit
    end

    def update
        if @expense_tuple.update(expense_params)
            redirect_to edit_expense_tracker_path, notice: "The Expense Details were saved successfully."
        else
            render :edit
        end
    end

    def destroy
        @expense_tuple.destroy
        redirect_to :action => 'index', notice: "Successfully removed Expense ID #{@expense_tuple.id}"
        #Book.find(params[:id]).destroy
    end

    def new
        @expense_tuple = ExpenseTracker.new
        #selected_itinerary = @itineraries_tuple.where(description: params[:description])
    end

    def create
        @expense_tuple = ExpenseTracker.new(expense_params)
        if @expense_tuple.save
            redirect_to expense_trackers_path, notice: "The Expense Details were saved successfully."
        else
            render :new
        end
    end

    def show
    end

    private
    def set_expense_tuple_with_id
        @expense_tuple = ExpenseTracker
        .joins("inner join itineraries on itineraries.id = expense_trackers.itineraries_id")
        .select("expense_trackers.id AS id, expense_trackers.total_budget, expense_trackers.itineraries_id, expense_trackers.accommodation, expense_trackers.transportation, expense_trackers.meal, expense_trackers.other, expense_trackers.remaining_budget, itineraries.description")
        .order("expense_trackers.itineraries_id ASC").find(params[:id])

        #itinerary_tuple = Itinerary.where()
    end

    def get_itinerary_tuple
        @itineraries_tuple = Itinerary.all.select('id, description').order("id ASC")
    end

    def expense_params
        params.require(:expense_tracker).permit(:total_budget, :itineraries_id, :accommodation, :transportation, :meal, :other, :remaining_budget)
    end

end