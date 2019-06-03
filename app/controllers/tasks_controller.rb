class TasksController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def summary
    @userid = current_user.id
    #日毎の集計
    @calendar_tasks = Task.find_by_sql(["select category_id ,sum(minutes) as minutes, updated_day from tasks where user_id = #{@userid} and complete = 1 group by updated_day"])
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).where(complete: false).page(params[:page]).per(5)
    #各カテゴリー毎の集計
    @query = Task.find_by_sql(["select category_id ,sum(minutes) as minutes from tasks where user_id = #{@userid} and complete = 't' group by category_id"])
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

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: '登録しました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: '更新しました' }
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
      format.html { redirect_to tasks_url, notice: '削除しました.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to tasks_url if @task.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :hours, :minutes, :complete, :category_id, :image, :updated_day)
    end
end
