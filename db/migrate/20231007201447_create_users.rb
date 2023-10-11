class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.boolean :admin, default: false, null: false # Add the 'admin' attribute here
      t.timestamps
    end
  end
end
