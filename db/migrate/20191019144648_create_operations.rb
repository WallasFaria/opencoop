class CreateOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :operations do |t|
      t.string :type
      t.decimal :value, precision: 11, scale: 4
      t.references :account, null: false, foreign_key: true
      t.references :operable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
