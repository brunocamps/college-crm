class UsersController < ApplicationController 

    before_action :require_admin, only: [:destroy]

    def index
        @users = User.all.order(created_at: :asc)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.update(user_params)
            redirect_to @user, notice: "User was successfully updated."
        else
            render :edit
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: "User was successfully destroyed!"
    end

    private

    def user_params
        list_allowed_params = []
        list_allowed_params += [:email] if current_user == @user || current_user.admin?
        list_allowed_params += [*User::ROLES] if current_user.admin?
        params.require(:user).permit(list_allowed_params)
        # params.require(:user).permit(*User::ROLES, :email) 
    end

    def require_admin
        unless current_user.admin?
            redirect_to root_path, alert: "You are not authorized to perform this action."
        end
    end

    def require_admin_or_owner
        @user = User.find(params[:id])
        unless current_user.admin? || current_user = @user
            redirect_to (request.referrer || root_path), alert: "You are not authorized to perform this action"
        end
    end

end

    