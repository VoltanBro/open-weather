class HomeController < ApplicationController
  def show
    @body ||= Weather::City.call
  end
end
