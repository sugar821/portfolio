class Admin::UsersController < ApplicationController
    def edit
        @user = User.find_by(id: params[:id])
    end
    
    def update
        @user = User.find_by(id: params[:id])
        @user.update!
        redirect_to admin_tasks_console_path
    end
  
    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to admin_tasks_console_path
    end
end
