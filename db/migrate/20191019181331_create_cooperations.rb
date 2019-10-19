class CreateCooperations < ActiveRecord::Migration[6.0]
  def change
    create_table :cooperations do |t|
      t.references :cooperative, null: false, foreign_key: true
      t.references :associate, null: false, foreign_key: true
      t.decimal :share_capital, precision: 11, scale: 2, default: 0

      t.timestamps
    end
  end
end
