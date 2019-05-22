class Admin::UsersController < ApplicationController
    def edit
        @user = User.find_by(id: params[:id])
    end
    
    # def update
    #     @user = User.find_by(id: params[:id])
    #     @user.update
    #     if @user.save(user_params)
    #         redirect_to admin_tasks_console_path
    #     else
    #         render :edit
    #     end
    # end
    
    
    def update
        @user = User.find_by(id: params[:id])
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to admin_tasks_console_path, notice: '更新しました' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
          end
        end
    end
  
    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to admin_tasks_console_path
    end
    
    def user_params
      params.require(:user).permit(:nick_name, :admin, :email)
    end
end
