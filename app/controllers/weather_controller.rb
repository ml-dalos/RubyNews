class WeatherController < ApplicationController

  DIRECTIONS = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW].freeze

  def index
    @weather = parse_weather
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

  def one_day
    86_400
  end

  private

  def parse_location
    url_location = "http://api.db-ip.com/v2/c19b3558fbbf6b72dffdb99cf85139c7fe0663e7/#{request.ip}"
    JSON.parse(Net::HTTP.get(URI(url_location)))['city']
  end

  def weather_json
    city = parse_location
    url_weather = "http://api.openweathermap.org/data/2.5/forecast?q=#{city}&mode=json&appid=172d1d74437e766c4bd5cde75c58e0da"
    JSON.parse(Net::HTTP.get(URI(url_weather)))
  end

  def parse_weather
    list = weather_json['list']
    date = list[0]['dt'] + one_day
    weather = [list.shift]
    list.each do |forecast|
      if forecast['dt'] == date
        date += one_day
        weather << forecast
      end
    end
    weather
  end


end
