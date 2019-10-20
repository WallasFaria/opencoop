class AddStatusToAssemblies < ActiveRecord::Migration[6.0]
  def change
    add_column :assemblies, :status, :integer, default: 0
  end
end
