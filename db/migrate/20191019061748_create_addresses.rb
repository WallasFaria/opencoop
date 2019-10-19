class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :zipcode
      t.string :neighborhood
      t.string :city
      t.string :state
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
