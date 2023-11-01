class RenameTitleToNameInWorkspaces < ActiveRecord::Migration[7.0]
  def change
    rename_column :workspaces, :title, :name
  end
end
