class AddWorkspaceIdToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :workspace, null: false, foreign_key: true
  end
end
