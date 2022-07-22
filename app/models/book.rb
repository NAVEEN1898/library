# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  has_one :issue
  has_one_attached :image
  paginates_per 2
  acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests
end
