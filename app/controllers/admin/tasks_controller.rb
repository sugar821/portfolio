class Admin::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = Task.ransack(params[:q])
    @category = Category.all 
    respond_to do |format|
      format.html
        @tasks = @q.result(distinct: true).order(id: "DESC").page(params[:page]).per(10)
      format.csv do
        @tasks = @q.result(distinct: true).order(id: "DESC")
        send_data render_to_string, filename:"tasks-#{Time.zone.now.strftime('%Y%m%d%s')}.csv"
      end
    end
  end
  
  def console
    @users = User.all
  end
    
  #CSV 文字コードUTF-8 excelに直接出すと文字化けする  
  def search
        @q = current_user.tasks.ransack(params[:q])
        @category = Category.all 
    respond_to do |format|
      format.html
        @tasks = @q.result(distinct: true).order(id: "DESC").page(params[:page]).per(5)
      format.csv do
        @tasks = @q.result(distinct: true).order(id: "DESC")
        send_data render_to_string, filename:"tasks-#{Time.zone.now.strftime('%Y%m%d%s')}.csv"
      end
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  def edit
  end

  def create
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to admin_tasks_path, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to admin_tasks_path, notice: '削除しました.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find_by(id: params[:id])
      redirect_to tasks_url if @task.nil?
    end

    def task_params
      params.require(:task).permit(:title, :hours, :minutes, :complete, :category_id, :image, :updated_day)
    end
end

