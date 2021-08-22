module HomeHelper
  def city_name
    @body['name']
  end

  def temp
    temp = @body.dig('main', 'temp').to_i
    "#{temp.round(1)}C#{celsius_sym}"
  end

  def feels_like
    temp = @body.dig('main', 'feels_like')
    "#{temp.round(1)}C#{celsius_sym}"
  end

  def sky
    @body['weather'].first['main'].downcase
  end

  private

  def celsius_sym
    "\xC2\xB0"
  end
end
