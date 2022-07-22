# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book) }
  let(:issue) { FactoryBot.create(:issue) }

  before do
    sign_in(user)
  end

  describe '#index' do
    it 'show all books' do
      get :index
      expect(assigns(:books)).to eq([book])
    end
  end

  describe '#create' do
    it 'it issue book' do
      post :create, params: { book_id: book.id, user_id: user.id }
      expect(response.status).to eq(302)
    end
  end
end
