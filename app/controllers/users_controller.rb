# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @books = Book.order(:id).page params[:page]
    MailForExpiredPlanUserJob.perform_now
  end

  def buy
    @user = User.find_by_id params[:user][:id]
    if @user.update(plan_id: params[:user][:plan_id], expiry: true, expiry_date: Time.now.to_date)
      UserMailer.with(user: @user).welcome_email.deliver_later
      redirect_to issues_path, notice: 'Mail send succesfully'
    else
      render :buy, status: :unprocessable_entity
    end
  end

  def all_users
    @users = User.where(plan_id: params[:plan_id])
  end

  def search
    @user = User.all.where('email LIKE :search ', search: "%#{params[:search]}%")
  end

  private

  def buy_params
    params.require(:user).permit(:plan_id)
  end
end
