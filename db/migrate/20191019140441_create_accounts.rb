class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.decimal :balance, precision: 20, scale: 4, default: 0
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
