class HomeController < ApplicationController
  def show
    response = Weather::Request.call(weather_params)
    if response.status == 200
      @body ||= Weather::CityInfo.call(response)
    else
      redirect_to :root, alert: t('errors.city_not_found')
    end
  end

  private

  def weather_params
    params.permit(:city)
  end
end
