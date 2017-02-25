class ListsController < ApplicationController
    before_action :authenticate
    def new
       user = User.find(params[:user_id])
       @list= List.new(user: user)
    end
    
    def create
        List.create(list_params)
        redirect_to user_path(params[:user_id])
    end
    def destroy
    unless List.find_by(id: params[:id])
         redirect_to user_path(params[:user_id])
         flash[:error] = "List not Found"
    end
    List.destroy(params[:id])
    redirect_to user_path(params[:user_id])
    flash[:notice] = "Successfully destroyed"
    end

    def edit
    @list=List.find_by(id: params[:id]) 
    unless @list
    redirect_to user_path(params[:user_id]) 
    end     
    end

    def update
    @list=List.find_by(id: params[:id])
    unless @list
    redirect_to user_path(params[:user_id]) 
    end 
    @list.update(title: params[:list] [:title])
    redirect_to user_path(params[:user_id]) 
    flash[:notice] = "Successfully update..."
    end

    
    private
    def list_params
        params.require(:list).permit(:title, :user_id)
    end
    
    def authenticate
    redirect_to(root_path) unless session[:current_user_id] == params[:user_id]
    end

end
