class WeatherController < ApplicationController
  def index
    redirect_to '/sign_in' unless helpers.current_user
    @weather = helpers.parse_weather
  rescue
    render 'error'
  end
end
