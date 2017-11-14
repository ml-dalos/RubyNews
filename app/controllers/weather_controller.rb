class WeatherController < ApplicationController
  def index
    @weather = helpers.parse_weather
  end
end
