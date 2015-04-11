xml.instruct!
xml.cars do
  @cars.each do |car|
    xml.car do
      xml.make car.make
      xml.model car.model
      xml.price number_to_currency car.price
      xml.year car.year
    end
  end

end
