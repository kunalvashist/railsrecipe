class ApplicationController < ActionController::Base

  helper_method :current_chef,:loggedin?

  def current_chef
    @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def loggedin?
    !!current_chef
  end

  def require_user
    if !loggedin?
      flash[:danger] = 'You need to be logged in to perform action'
      redirect_to root_path
    end
  end
end
