class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
    end

    def create
        review = Review.new(permit_params)
        if review.save
             redirect_to reviews_path
        else
             redirect_to new_review_path
        end
  
     end

    def show
        @review = Review.find(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
    end

    private
    def permit_params
        params.require(:review).permit(:comment, image: []).merge(user_id: current_user.id)
    end
end
