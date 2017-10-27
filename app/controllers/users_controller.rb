class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(user)
      #redirect_to main index page
    else
      flash.now[:errors] = @user.erros.full_messages
      render :new
    end
  end

  def show
    render :new
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
