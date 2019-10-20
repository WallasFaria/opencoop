class CreateAssemblies < ActiveRecord::Migration[6.0]
  def change
    create_table :assemblies do |t|
      t.decimal :value_to_split, precision: 20, scale: 2
      t.date :pre_assembly_date
      t.date :voting_date
      t.references :cooperative

      t.timestamps
    end
  end
end
