class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only:[:index,:new]
    before_action :set_review, only:[:edit, :update, :destroy]

    def index
        @reviews = Review.where task_id: params[:task_id]
    end
    
    def new
        @review = Review.new
    end
    
    def edit
    end
    
    def create
        logger.debug params
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        if @review.save!
          redirect_to root_path
        else
          head :no_content
        end
    end
    
    def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to root_path, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    end
    
    def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: '削除しました.' }
      format.json { head :no_content }
    end
    end

 private
 
 def review_params
  params.require(:review).permit(:comment, :good, :task, :task_id, :user,:user_id)
 end

 def set_task
  @task= Task.find(params[:task_id])
 end
 
 def set_review
  @review= Review.find(params[:id])
 end
end
