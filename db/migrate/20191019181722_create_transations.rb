class CreateTransations < ActiveRecord::Migration[6.0]
  def change
    create_table :transations do |t|
      t.string :description
      t.decimal :value, precision: 11, scale: 2
      t.references :cooperation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
