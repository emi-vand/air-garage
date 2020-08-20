class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :destroy, :update, :approve]

  def index
    @rentals = Rental.all
  end

  def show
    @rentals = Rental.find(params[:id])
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
    @rental.calculated_price = @car.price * (@rental.drop_off-@rental.pick_up)
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render "cars/show"
    end
  end

  def approve
     @rental.update(status: "approved")
     if @rental.state == "approved"
       redirect_to user_path(current_user)
     else
       redirect_to user_path(current_user)
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
