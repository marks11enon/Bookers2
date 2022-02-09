class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user =current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = user.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have update user successfully."
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
