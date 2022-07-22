# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'naveenA@gmail.com'
  def welcome_email 
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def expires_plan_email
     @user = params[:user]
     @url = 'http://example.com/login'
     mail(to: @user.email, subject: 'Plan Expires')
  end
end
