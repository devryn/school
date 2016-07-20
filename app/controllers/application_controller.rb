class ApplicationController < ActionController::Base

  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_logged_in?
    current_user.present?
  end

  def authenticate_user!
    unless user_logged_in?
      flash[:alert] = "Please sign in to do this"
      redirect_to sessions_sign_in_path
    end
  end

  helper_method :current_user, :user_logged_in?
end
