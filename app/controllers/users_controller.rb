class UsersController < ApplicationController

  layout 'users'

  def index
      @title = "Users"
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      @title = @user.name
      @listings = @user.listings.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
        if @user.update_attributes!(params[:user])
          flash[:notice] = "Successfully updated user account."
          redirect_to @user
        else
          render :action => 'edit'
        end
      rescue Exception => e #rescue the right exception, when you remember what it was
      flash[:error] = e.message
      redirect_to edit_user_path(@user)
  end
end
