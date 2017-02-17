class ReviewsController < ApplicationController

  def create
    
    @product = Product.find(params[:product_id].to_i)
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:product_id].to_i)
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product), notice: 'Review deleted!'
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
