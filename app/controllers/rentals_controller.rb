class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :destroy, :update]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @car = Car.find(params[:car_id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @user = current_user
    @car = Car.find(params[:car_id])
    @rental.car = @car
    @rental.user = @user
    if @rental.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   @rental.update(rental_params)
  #   redirect_to @rental
  # end

  # def destroy
  #   @rental.destroy
  #   redirect_to car_path
  # end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:car_id, :user_id, :pick_up, :drop_off)
  end

end
