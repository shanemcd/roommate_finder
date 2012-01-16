class UsersController < ApplicationController
  def index
      @title = "Users"
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      @listings = @user.listings.all
    end
end
