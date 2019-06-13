class ReviewsController < ApplicationController
    before_action :set_task, only:[:new]

    def new
        logger.debug @task.id
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        # @review.task_id = 1
       
        logger.debug "------------↓@comment id↓------------"
        logger.debug @task
        
        logger.debug "------------↓params↓------------"
        logger.debug params
        if @review.save!
          head :no_content
        else
          head :no_content
        end
    end

 private

 def review_params
  params.require(:review).permit(:comment, :good, :task, :user,:user_id)
 end

 def set_task
  @task= Task.find(params[:task_id])
 end
end
