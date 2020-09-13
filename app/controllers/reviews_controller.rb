class ReviewsController < ApplicationController
  before_action :set_cocktail, except: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail

    if @review.after_save
      redirecto_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    cocktail = review.cocktail
    review.destroy

    redirect_to cocktail_path(cocktail)
  end

  private

  def set_cocktail
    @coctail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end

end
