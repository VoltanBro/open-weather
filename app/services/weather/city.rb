module Weather
  class City < BaseService
    def call
      body
    end

    def weather_api
      Rails.application.credentials[:weather_api]
    end

    def request
      @response ||= Faraday.get "http://api.openweathermap.org/data/2.5/weather?q=#{user_city}&appid=#{weather_api}&units=metric"
    end

    def user_city
      'Kiev'
    end

    def body
      JSON.parse(request.body)
    end
  end
end
