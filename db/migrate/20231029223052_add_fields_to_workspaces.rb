class AddFieldsToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    # add_column :workspaces, :description, :string  # Comment this out or remove
    add_column :workspaces, :visibility, :string
    add_column :workspaces, :deadline, :date
  end
end
