class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[ show edit update destroy ]

  # GET /itineraries or /itineraries.json
  def index
    @itineraries = Itinerary.all
  end

  # GET /itineraries/1 or /itineraries/1.json
  def show
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries or /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to itinerary_url(@itinerary), notice: "Itinerary was successfully created." }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1 or /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to itinerary_url(@itinerary), notice: "Itinerary was successfully updated." }
        format.json { render :show, status: :ok, location: @itinerary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1 or /itineraries/1.json
  def destroy
    @itinerary.destroy

    respond_to do |format|
      format.html { redirect_to itineraries_url, notice: "Itinerary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def itinerary_params
      params.require(:itinerary).permit(:description, :location, :datetime)
    end
end
