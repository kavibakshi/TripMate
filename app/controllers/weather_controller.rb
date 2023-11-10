class WeatherController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # Check if the user provided a city in the query parameter
    city = params[:city]

    if city.present?
      # When the user provides a city
      @url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=f07b4804fb6c7e1268ecc8e897967ea2&units=metric"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)

      # Error handling for API call data
      if @output.nil?
        @city_output = "Error"
        @country_output = "Error"
        @weather_output = "Error"
        @icon_output = "Error"
        @temp_output = "Error"
        @feelslike_output = "Error"
        @pressure_output = "Error"
        @humidity_output = "Error"
      
      # Parse data and store into variables
      else
        @city_output = @output['name']
        @country_output = @output['sys']['country']
        @weather_output = @output['weather'].first['main']
        @icon_output = @output['weather'].first['icon']
        @temp_output = @output['main']['temp']
        @feelslike_output = @output['main']['feels_like']
        @pressure_output = @output['main']['pressure']
        @humidity_output = @output['main']['humidity']
      end
      @city_specified = true # City is specified
    else
      # When the user doesn't provide a city
      @city_specified = false # City is not specified
    end

    respond_to do |format|
      format.js # Respond to JavaScript format
      format.html # Respond to HTML format as a fallback
    end
  end
end
