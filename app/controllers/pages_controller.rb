class PagesController < ApplicationController
    def home
    end
    def sign_in
       @user = User.find_by(login: params[:login],password: params[:password])
       if @user
        session[:current_user_id] = @user.id.to_s
        redirect_to user_path(@user.id)
       else
       redirect_to root_path
       flash[:error] = "User not exist!"
       end
    end
end
