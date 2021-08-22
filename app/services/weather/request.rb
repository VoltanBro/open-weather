module Weather
  class Request < BaseService
    def initialize(params)
      @params = params
    end

    def call
      @response ||= Faraday.get "http://api.openweathermap.org/data/2.5/weather?q=#{user_city}&appid=#{weather_api}&units=metric"
    end

    private

    def weather_api
      Rails.application.credentials[:weather_api]
    end

    def user_city
      return params[:city] if params.present?

      Constants::DEFAULT_CITY
    end

    attr_accessor :params
  end
end
