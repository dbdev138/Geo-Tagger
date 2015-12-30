class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :client_id
      t.string :client_secret
      t.string :ws_key

      t.timestamps null: false
    end
  end
end
