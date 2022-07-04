class Issue < ApplicationRecord
	
	belongs_to :user
	#belongs_to :book
	# after_save :issue_book


	# private
	# def issue_book
	# 	puts "Issue book succesfully"
	# end
end
