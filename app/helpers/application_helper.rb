module ApplicationHelper

  def average_rating(product)
    average_rating = 0
    reviews =  Review.where(product_id: product.id)
    if reviews.length > 0
      average_rating = Review.where(product_id: product.id).average(:rating).round(2)
    end
    average_rating
  end
end
