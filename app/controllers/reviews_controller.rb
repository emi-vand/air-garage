class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @rental = Rental.find(params[:rental_id])
  end

  def create
    @review = Review.new(review_params)
    @review.rental = Rental.find(params[:rental_id])
    if @review.save
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
