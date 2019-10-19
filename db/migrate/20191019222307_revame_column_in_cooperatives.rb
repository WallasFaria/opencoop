class RevameColumnInCooperatives < ActiveRecord::Migration[6.0]
  def change
    rename_column :cooperatives, :cost_per_transation, :cost_per_transaction
  end
end
