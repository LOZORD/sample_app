class SessionsController < ApplicationController

  def new
  end

  def create
    session_params = params[:session]
    user = User.find_by(email: session_params[:email].downcase)

    if user && user.authenticate(session_params[:password])
      # sign in user and redirect to their page
      sign_in user
      redirect_back_or user
    else
      # create error message and redirect signin page
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
