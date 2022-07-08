require 'rails_helper'

RSpec.describe Admin::PlansController, type: :controller do
  let!(:plan) { FactoryBot.create(:plan) }
  let!(:user) { FactoryBot.create(:user) }

  before do
    # byebug
    sign_in(user)
  end

  describe '#index' do
    it 'show all plans' do
      get :index
      expect(assigns(:plans)).to eq([plan])
    end
  end

  describe '#show' do
    it 'find plan(plan_id)' do
      get :show, params: { id: plan.id }
      expect(assigns(:plan)).to eq(plan)
    end
  end

  describe '#create' do
    it 'create plan(plan)' do
      post :create, params: { plan: { plan_name: plan.plan_name, plan_description: plan.plan_description } }
      # expect(Book.count).to eq(2)
      expect(response.status).to eq(302)
    end
  end

  describe '#edit' do
    it 'edit plan ' do
      # byebug
      get :edit, params: { id: plan.id }
      expect(assigns(:plan)).to eq(plan)
    end
  end

  describe '#update' do
    it 'update plan(plan_id)' do
      # byebug
      patch :update,
            params: { plan: { plan_name: plan.plan_name, plan_description: plan.plan_description }, id: plan.id }
      expect(assigns(:plan)).to eq(plan)
    end
  end

  describe '#destroy' do
    it 'destroy plan(plan_id)' do
      delete :destroy, params: { id: plan.id }
      expect(response.status).to eq(302)
    end
  end
end
