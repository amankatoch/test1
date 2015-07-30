class AddTargetFundAmountToAppeals < ActiveRecord::Migration
  def change
    add_column :appeals, :target_fund_amount, :integer
  end
end
