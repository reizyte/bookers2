class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @users = User.all
  end

  def edit
   @user = User.find(params[:id])
   if @user.id != current_user.id
     redirect_to user_path(current_user.id)
   end
  end


  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(current_user.id)
    else
       render :edit
    end
  end

  def followeds
    user = User.find(params[:id])
    @users = user.followeds
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
