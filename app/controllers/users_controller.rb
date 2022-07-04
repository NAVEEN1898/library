class UsersController < ApplicationController
   before_action :authenticate_user!
  def index
    
    @users = User.all
    @books = Book.order(:id).page params[:page]

  end

  def buy 
    @user = User.find_by_id params[:user][:id]
    if @user.update(plan_id: params[:user][:plan_id])
      #byebug
      UserMailer.with(user: @user).welcome_email.deliver_later
      redirect_to issues_path, notice: "Mail send succesfully"
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
