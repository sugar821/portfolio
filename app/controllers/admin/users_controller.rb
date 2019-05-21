class Admin::UsersController < ApplicationController
    def edit
        @user = User.find_by(id: params[:id])
    end
    
    def update
        @user = User.find_by(id: params[:id])
        @user.update!
        if @user.save(user_params)
            redirect_to admin_tasks_console_path
        else
            render :edit
        end
    end
  
    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to admin_tasks_console_path
    end
end
