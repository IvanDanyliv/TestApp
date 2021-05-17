class UsersController < ApplicationController
  before_action :user, only: %i[show]

  def index
    @users = User.all
  end

  def show; end

  private

  # def user_params
  #   params.require(:user).permit(
  #     :first_name, :last_name,
  #     :email, :password,
  #     :city, :coordinates
  #   )
  # end

  def user
    @user ||= User.find(params[:id])
  end
end
