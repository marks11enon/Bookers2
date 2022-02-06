class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
end
