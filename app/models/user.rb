# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :plan, optional: true
  has_many :issues

  # paginates_per 2
  # has_one :user_plan
  # has_one :plan , through: :user_plan

  # has_many :books
  # has_many  :user_plans
  # has_many  :plans, through: :user_plans
  #  has_many :issue

  # private
  # def self.search(search)
  #   if search
  #     @user = User.where("email LIKE ?","%" + params[:search] +"%")
  #   # else
  #   #    find(:all)
  #   end
  # end
end
