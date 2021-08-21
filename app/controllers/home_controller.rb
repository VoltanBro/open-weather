class HomeController < ApplicationController
  def show
    render json: 'Hello from home'
  end
end
