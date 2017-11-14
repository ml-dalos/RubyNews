class WeatherController < ApplicationController
  def index
    @weather = helpers.parse_weather
  rescue
    render 'error'
  end
end
