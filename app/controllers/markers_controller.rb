# app/controllers/markers_controller.rb
class MarkersController < ApplicationController
    before_action :authenticate_user! 
    user_id = current_user.id
  
    def index
      @markers = current_user.markers
      render json: @markers
    end
  
    def create
      @marker = current_user.markers.build(marker_params)
  
      if @marker.save
        render json: @marker, status: :created
      else
        render json: @marker.errors, status: :unprocessable_entity
      end
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
  