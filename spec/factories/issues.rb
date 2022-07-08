# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    user { create(:user) }
    book { create(:book) }
  end
end
