class Admin::UsersController < ApplicationController
    def edit
        @user = User.find_by(id: params[:id])
    end
    
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
    
    def delete_avatar
      @user = User.find_by(id: params[:id])
      @user.avatar.purge
      respond_to do |format|
        format.html { redirect_to edit_user_path, notice: '削除しました.' }
        format.json { head :no_content }
      end
    end
    
    private
      def user_params
        params.require(:user).permit(:nick_name, :admin, :email, :avatar)
      end
end
