class SessionsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def new
    @user = User.new

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @user }
    end
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      session[:email] = params[:session][:email].downcase
      session[:user_id] = user.id
      session[:user_admin] = user.admin
      redirect_to home_page_url email: params[:session][:email].downcase
    else
      redirect_to login_url, alert: "Invalid Username or Password"
    end
  end

  def destroy
    session[:email] = nil
    session[:user_id] = nil
    session[:user_admin] = nil
    redirect_to login_url, alert:"Successfully logged out"
  end
end
