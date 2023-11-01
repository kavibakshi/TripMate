class AddWorkspaceToLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :lists, :workspace, null: false, foreign_key: true
  end
end
