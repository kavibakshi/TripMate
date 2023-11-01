class ChangeVisibilityToEnumInWorkspaces < ActiveRecord::Migration[7.0]
  def change
    change_column :workspaces, :visibility, 'integer USING CAST(visibility AS integer)'
  end
end
