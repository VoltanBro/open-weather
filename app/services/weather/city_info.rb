module Weather
  class CityInfo < BaseService
    def initialize(response)
      @response = response
    end

    def call
      JSON.parse(@response.body)
    end
  end
end
