class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index

    @cars = Car.geocoded
    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car })
      }
    end
    
    @cars = @cars.filter(params.slice(:make, :min_price, :max_price, :location))

  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
    @rental = Rental.new
  end

  def edit
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def update
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :seats, :color, :price, :location, photos: [])
  end

  def set_car
    @car = Car.find(params[:id])
  end

end
