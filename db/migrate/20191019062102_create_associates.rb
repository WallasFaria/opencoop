class CreateAssociates < ActiveRecord::Migration[6.0]
  def change
    create_table :associates do |t|
      t.string :name
      t.string :date_of_birth
      t.string :marital_status
      t.string :nationality
      t.string :profession
      t.string :telephone
      t.string :cpf

      t.timestamps
    end
  end
end
