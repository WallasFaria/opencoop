class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.references :assembly, null: false, foreign_key: true
      t.string :owner_name
      t.string :optionl_1_name
      t.decimal :optionl_1_percent, precision: 5, scale: 2
      t.string :optionl_2_name
      t.decimal :optionl_2_percent, precision: 5, scale: 2
      t.integer :total_votes, default: 0

      t.timestamps
    end
  end
end
