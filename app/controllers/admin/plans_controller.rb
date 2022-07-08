# frozen_string_literal: true

module Admin
  class PlansController < ApplicationController
    before_action :authenticate_user!

    def index
      @plans = Plan.all
    end

    def show
      # byebug
      @plan = Plan.find(params[:id])
    end

    def new
      @plan = Plan.new
    end

    def create
      # byebug
      @plan = Plan.new(plan_params)
      if @plan.save
        # flash[:notice] = "Buy successfully"
        redirect_to admin_plans_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      # byebug
      @plan = Plan.find(params[:id])
    end

    def update
      # byebug
      @plan = Plan.find(params[:id])
      if @plan.update(plan_params)
        redirect_to admin_plans_path
      else
        render :edit
      end
    end

    def destroy
      # byebug
      @plan = Plan.find(params[:id])
      @plan.destroy
      redirect_to admin_plans_path
      # render :index
    end

    private

    def plan_params
      params.require(:plan).permit(:plan_name, :plan_description, :plan_rate)
    end
  end
end
