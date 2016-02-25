class CsrsController < ApplicationController

  def index
    @csr_users = User.where(:roles => "CSR")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save

        format.html { redirect_to csrs_path, notice: 'Customer Service Representative was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :roles, :password, :password_confirmation)
  end
end
