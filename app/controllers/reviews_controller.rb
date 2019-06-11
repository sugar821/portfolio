class ReviewsController < ApplicationController
    def new
        @task = Task.find_by(id: params[:id])
        respond_to do |format|
            format.js
        end
    end 
end

# class ReviewsController < ApplicationController
#     before_action :set_task, only:[:new, :create]

#     def new
#         @review = Review.new
#     end
    
#     def create
#         @review = Review.new(review_params)
#         @review.attributes = {
#             task_id: params[:task_id],
#             user_id: current_user.id
#           }
#         if @review.save
#           redirect_to @review.task, notice: "レビューを登録しました。"
#         else
#           render :new
#         end
#     end

#  private

#  def review_params
#   params.require(:review).permit(:comment, :good, :task, :user)
#  end

#  def set_task
#   @task= Task.find(params[:task_id])
#  end
# end
