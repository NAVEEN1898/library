# frozen_string_literal: true

class Change < ActiveRecord::Migration[6.1]
  def change
    remove_index 'users', ['plan_id'],
                 name: 'index_users_on_plan_id'
  end
end
