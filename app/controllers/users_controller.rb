class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
      redirect_to :show
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have update user successfully."
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def screen_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end


end
