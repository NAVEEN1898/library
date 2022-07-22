# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  has_one :issue
  has_one_attached :image
  paginates_per 2
  has_many :tags 
  accepts_nested_attributes_for :tags
end
