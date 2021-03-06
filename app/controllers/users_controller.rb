class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @goals = @user.goals.paginate(page: params[:page])
  end

  def update
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for joining!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  

end
