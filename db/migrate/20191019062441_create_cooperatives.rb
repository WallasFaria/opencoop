class CreateCooperatives < ActiveRecord::Migration[6.0]
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.text :description
      t.text :short_description
      t.references :segment, null: false, foreign_key: true
      t.integer :minimum_of_associates
      t.decimal :value_minimum_to_start, precision: 11, scale: 2
      t.text :indicators
      t.integer :development_time_in_days
      t.decimal :share_capital, precision: 11, scale: 2
      t.string :video_url
      t.integer :status
      t.integer :founder_id

      t.timestamps
    end
  end
end
