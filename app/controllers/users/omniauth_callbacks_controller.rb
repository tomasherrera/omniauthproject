class Users::OmniauthCallbacksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def google_apps
    @user = User.find_for_google_apps(auth)
    p auth
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      @user.save
      sign_in(@user, bypass: true)
      redirect_to root_path
    end
  end

  def failure
    logger.info params.inspect
    render nothing: true
  end

  private

  def auth ; request.env["omniauth.auth"] ; end
end