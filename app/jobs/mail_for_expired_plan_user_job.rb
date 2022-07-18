class MailForExpiredPlanUserJob < ApplicationJob
  queue_as :default

  def perform
    @users = User.all.where(expiry: true)
    @users.each do |user|
      expiry_date = user.plan_buy_date + 2.day
      if expiry_date == Time.now.to_date
        user.update(expiry: false, plan_id: nil, plan_buy_date: nil)
        UserMailer.with(user: user).expires_plan_email.deliver_now
      end 
    end 
  end 
end
