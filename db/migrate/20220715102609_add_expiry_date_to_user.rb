class AddExpiryDateToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :plan_buy_date, :date
  end
end
