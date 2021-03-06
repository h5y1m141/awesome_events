class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: t("controllers.users.login.success")
  end

  def destory
    reset_session
    redirect_to root_path, notice: t("controllers.users.logout.success")
  end
end
