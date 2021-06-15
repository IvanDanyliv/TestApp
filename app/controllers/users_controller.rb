class UsersController < ApplicationController
  before_action :user, only: %i[show]

  def index
    @ransack = User.ransack(params[:q])
    @users = @ransack.result.page(params[:page]).per(12)
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :city)
  end

  def user
    @user ||= User.find(params[:id])
  end
end
