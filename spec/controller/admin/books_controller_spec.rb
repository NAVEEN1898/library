# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::BooksController, type: :controller do
  let(:user1) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book) }

  describe '#index' do
    it 'show all books' do
      get :index
      byebug
      expect(assigns(:books).count).to eq(1)
    end
  end
end
