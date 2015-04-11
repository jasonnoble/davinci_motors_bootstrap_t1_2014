class CarsController < ApplicationController
  before_action :find_car, only: [:edit, :update, :claim]

  def index
    @cars = Car.where(user_id: nil).all
  end

  def my_cars
    @cars = Car.where(user_id: current_user).all
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def claim
    @car.user = current_user
    @car.save
    redirect_to root_path,
      notice: "#{@car.make} #{@car.model} has been moved to your inventory."
  end

  def update
    @car.update(car_params)
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} updated"
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} created"
  end

  private
  def car_params
    params.require(:car).permit(:make, :year, :model, :price)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
