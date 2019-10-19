class AddCostPerTrasationToCooperatives < ActiveRecord::Migration[6.0]
  def change
    add_column :cooperatives, :cost_per_transation, :decimal, precision: 4, scale: 2
  end
end
