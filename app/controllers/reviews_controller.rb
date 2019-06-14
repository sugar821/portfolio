class ReviewsController < ApplicationController
    before_action :set_task, only:[:new]

    def new
        @review = Review.new
    end
    
    def create
        logger.debug params
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        if @review.save!
          head :no_content
        else
          head :no_content
        end
    end

 private
 
 def review_params
  params.require(:review).permit(:comment, :good, :task, :task_id, :user,:user_id)
 end

 def set_task
  @task= Task.find(params[:task_id])
 end
end
