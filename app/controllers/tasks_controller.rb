class TasksController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page]).per(5)
    @userid = current_user.id
    @AAA = Task.find_by_sql(["select category_id ,sum(hours) as hours from tasks where user_id = #{@userid} group by category_id"])
  end
  
  #test用
  def test_index
    @calendar_tasks = current_user.tasks
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page]).per(5)
    @not_completed_tasks=current_user.tasks.where(complete:false)
     
    #CSV 文字コードUTF-8 excelに直接出すと文字化けする
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename:"tasks-#{Time.zone.now.strftime('%Y%m%d%s')}.csv"
      end
    end
  end
  
  def admin_index
    @q = Task.ransack(params[:q])
    @category = Category.all 
    @tasks = @q.result(distinct: true).page(params[:page]).per(10)
  end
  
  def admin_console
    @users = User.all
  end
    
  def search
    @q = current_user.tasks.ransack(params[:q])
    @category = Category.all 
    @tasks = @q.result(distinct: true).page(params[:page]).per(5)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    # @task= current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
      # @task = current_user.task.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
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
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
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
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      # @task = Task.find(params[:id])
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to tasks_url if @task.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :hours, :complete, :category_id, :image)
    end
end
