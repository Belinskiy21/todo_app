class ListsController < ApplicationController
    def new
    if session[:current_user_id] == params[:user_id]
       user = User.find(params[:user_id])
       @list= List.new(user: user)
    else
        redirect_to root_path
    end 
    end
    
    def create
        List.create(list_params)
        redirect_to user_path(params[:user_id])
    end
    
    private
    def list_params
        params.require(:user_id, :list).permit(:title)
    end
    
end
