class WeatherController < ApplicationController
  def index
    if !helpers.current_user
      redirect_to login_path
    else
      @weather = helpers.parse_weather
    end
  rescue
    render 'error'
  end
end
