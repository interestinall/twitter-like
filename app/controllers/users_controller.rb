class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

  end

  def new
    flash[:success] = "Welcome to the Twitter-like demo rails app!"
    @user = User.new

    if @user.save
      redirect_to(@user)
    else
      render 'new'
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end



      end
