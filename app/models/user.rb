# frozen_string_literal: true

class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :plan, optional: true
  has_many :issues
  
end
