class WeatherController < ApplicationController

  DIRECTIONS = %w!N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW!

  def index
    @weather = parse_weather
    respond_to do |format|
      format.js
    end
  end

  def get_direction(deg)
    DIRECTIONS[(deg/22.5 + 0.5).round % 16]
  end

  def get_icon(name)
    case name
    when /.*[Rr]ain/
      'tint'
    when /.*[Ss]now/
      'snowflake-o'
    when /.*[Cc]louds/
      'cloud'
    when /.*[Th]understorm/
      'bolt'
    when /.*[Mm]ist/
      'align-justify'
    when /.*[Cc]lear sky/
      'sun-o'
    else
       'thermometer-half'
    end
  end

  private

  def parse_location
    url_location = "http://api.db-ip.com/v2/c19b3558fbbf6b72dffdb99cf85139c7fe0663e7/#{request.ip}"
    JSON.parse(Net::HTTP.get(URI(url_location)))['city']
  end

  def get_weather_json
    city = parse_location
    url_weather = "http://api.openweathermap.org/data/2.5/forecast?q=#{city}&mode=json&appid=172d1d74437e766c4bd5cde75c58e0da"
    JSON.parse(Net::HTTP.get(URI(url_weather)))
  end

  def parse_weather
    get_weather_json.
  end

  def choose_icon main
  end

end
