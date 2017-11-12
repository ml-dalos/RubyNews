class WelcomeController < ApplicationController
  def index
    url_location = "http://api.db-ip.com/v2/c19b3558fbbf6b72dffdb99cf85139c7fe0663e7/#{request.ip}"
    @city = JSON.parse(Net::HTTP.get(URI(url_location)))['city']
    url_weather = "http://api.openweathermap.org/data/2.5/weather?q=#{@city}&appid=172d1d74437e766c4bd5cde75c58e0da"
    weather = JSON.parse(Net::HTTP.get(URI(url_weather)))
    @main = weather['weather'][0]['main']
    @temperature = weather['main']['temp']
    @humidity = weather['main']['humidity']
    @wind = weather['wind']['speed']
  end
end
