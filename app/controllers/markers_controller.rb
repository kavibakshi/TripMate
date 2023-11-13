# app/controllers/markers_controller.rb
class MarkersController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @marker = current_user.markers.create(marker_params)
      render json: @marker
    end
  
    def index
      @markers = current_user.markers
      render json: @markers
    end
  
    def destroy
      @marker = current_user.markers.find(params[:id])
      @marker.destroy
      head :no_content
    end
  
    private
  
    def marker_params
      params.require(:marker).permit(:latitude, :longitude)
    end
  end
  