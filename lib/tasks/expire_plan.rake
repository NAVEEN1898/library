	namespace :expiring_plan do
		desc "Reminder for expiring plan"
		task :expiry => :environment do 
			@users = User.all.where(expiry: true)
			@users.each do |user|
				byebug
				expiry_date = user.plan_buy_date + 2.day
				if expiry_date == Time.now.to_date
					user.update(expiry: false, plan_id: nil, plan_buy_date: nil)
					#UserMailer.with(user: @user).welcome_email.deliver_later
				end 
			end
		end
	end
