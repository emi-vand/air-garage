class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @cars = Car.all
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
      render 'new'
    end
  end

  def show
    # @user = User.find()
  end

  def edit
  end


  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def update
    @car.update(car_params)
    redirect_to @car
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :seats, :color, :price, :location)
  end

  def set_car
    @car = Car.find(params[:id])
  end
  
end
