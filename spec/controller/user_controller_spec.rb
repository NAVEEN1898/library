# frozen_string_literal: true

require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:book) { FactoryBot.create(:book) }
  before do
    sign_in(user)
  end

  describe '#index' do
    it 'show all users' do
      get :index
      expect(assigns(:books)).to eq([book])
    end
  end

  describe '#buy' do
    it 'buy plan(user_id)' do
      get :buy, params: { user: { id: user.id, plan_id: user.plan_id } }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe '#all_users' do
    it 'show all user(plan_id)' do
      get :all_users, params: { plan_id: user.plan_id }
      expect(assigns(:users)).to eq([user])
    end
  end

  describe '#search' do
    it 'show search book' do
      get :search, params: { search: user.email }
      expect(assigns(:user)).to eq([user])
    end
  end
end
