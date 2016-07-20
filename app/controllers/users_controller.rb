class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
      @users = User.all
  end

  def new
      @user = User.new
  end

  def edit
    if current_user != @user
      flash[:alert] = "You can only edit yourself!"
      redirect_to users_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save(user_params)
      redirect_to @user, notice: 'User has been created.'
    else
      render :new
    end
  end


  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Your information has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User has been deleted.' }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:school_id, :name, :email, :password, :password_confirmation)
  end
end
