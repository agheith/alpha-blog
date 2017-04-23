class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      #return this user if there is a seesion / what if this current user already exists?
      #if not, find the user based on the session
  end

  def logged_in?
      !!current_user
      #return true if i have a cuurent user
  end
  
  def require_user #if user is not logged in
      if !logged_in?
          flash[:danger] = "You must be logged in to perform that action"
          redirect_to root_path
      end
  end
end
