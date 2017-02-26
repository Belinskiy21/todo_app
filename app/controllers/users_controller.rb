class UsersController < ApplicationController
    def show
    if session[:current_user_id] == params[:id]
        @user=User.find(params[:id])
        @lists=@user.lists.includes(:tasks)
    else
        redirect_to root_path
    end
    end
    def new
     @user=User.new
    end
    def create
        @user=User.new(user_params)
     if @user.save
        session[:current_user_id] = @user.id.to_s
        redirect_to @user
        flash[:notice] = "Successfully created..."
     else
        redirect_to new_user_path
        flash[:error] = "Not created..."
     end
    end



    private
    def user_params
        params.require(:user).permit(:login, :password)
    end
end
