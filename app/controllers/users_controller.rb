class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      @conversations = Conversation.involving(current_user).order("created_at DESC")

    if current_user.roles === "Admin"
      @fetched_users = User.all
    elsif current_user.roles == 'CSR'
      @fetched_users = User.where(:csrg => current_user.csrg)
    else
      @fetched_users = []
    end

  end

  private

  def user_params
    params.require(:user).permit(:roles, :csrg)
  end
end
