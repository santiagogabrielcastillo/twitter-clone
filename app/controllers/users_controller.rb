class UsersController < ApplicationController
  before_action :set_user, only: %I[show follow]

  def show
  end

  def follow
    current_user.followings << @user
    render :show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
