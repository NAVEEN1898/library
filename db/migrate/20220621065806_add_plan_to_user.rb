# frozen_string_literal: true

class AddPlanToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :plan, foreign_key: true
  end
end
