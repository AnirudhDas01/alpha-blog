class UsersController < ApplicationController

before_action :set_user , only: [:show, :edit, :update, :destroy]
before_action :require_user, only: [:edit, :update]
before_action :require_same_user, only: [:edit, :update, :destroy ]

  def show

  @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "Welcone ,#{@user.username.upcase} to the Alpha Blog"
    redirect_to user_path(@user)
   else
    render 'new', status: :unprocessable_entity
   end
  end

  def edit


  end

  def update

    if @user.update(user_params)
      flash[:notice] = "Account Sucessfully Updated"
      redirect_to user_path(@user)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy

      session[:user_id] = nil  if @user == current_user 
      flash[:notice] = "Account deleted Sucessfully"
      redirect_to articles_path

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end


  def require_same_user

    if current_user != @user &&  !current_user.admin
      flash[:alert] = "You can only edit or deleted other user profiles."
      redirect_to users_path
    end
  end

end
