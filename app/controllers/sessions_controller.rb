class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        login(user)
        redirect_to root_path, notice: "ログインしました。"
      else
        redirect_to root_path, alert: "アカウントを有効化してください。"
    else
      redirect_to login_path, alert: "メールアドレスまたはパスワードが違います。"
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
