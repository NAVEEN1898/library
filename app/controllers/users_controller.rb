class UsersController < ApplicationController
   before_action :authenticate_user!
  def index
    @books = Book.all 
    @plans = Plan.all 
    @users = User.all
  end

  def buy 
    user = User.find_by_id params[:user][:id]
    #byebug
    if user.update(plan_id: params[:user][:plan_id])
      redirect_to issues_path
    else 
      render :buy, status: :unprocessable_entity
    end
  end

  def all_users
    #@plan = Plan.find(params[:id])
    @users = User.where(plan_id: params[:id])
  end

  def search 
    #@parameter = params[:search]
    @user = User.all.where("email LIKE :search ", search: "%#{params[:search]}%")  
  end


  private 
  def buy_params
    params.require(:user).permit(:plan_id) 
  end

  # def show 
  #   @user = User.search(params[:search])
  # end
end
