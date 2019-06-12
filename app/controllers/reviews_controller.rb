class ReviewsController < ApplicationController
     before_action :set_task, only:[:new, :create]

    def new
        @review = Review.new
        logger.debug("でばぐすたーと")
        logger.debug params
        logger.debug("でばぐend")
    end
    
    def create
        @review = Review.new(review_params)
        @review.attributes = {
            task_id: params[:task_id],
            user_id: current_user.id
          }
        if @review.save
          head :no_content
        else
          render :new
        end
    end

 private

 def review_params
  params.require(:review).permit(:comment, :good, :task, :user)
 end

 def set_task
  @task= Task.find(params[:task_id])
 end
end
