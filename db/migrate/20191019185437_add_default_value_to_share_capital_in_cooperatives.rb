class AddDefaultValueToShareCapitalInCooperatives < ActiveRecord::Migration[6.0]
  def change
    change_column_default :cooperatives, :share_capital, 0
  end
end
