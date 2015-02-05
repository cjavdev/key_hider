class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :session_token, null: false
      t.string :nickname, null: false
      t.string :provider, null: false

      t.timestamps null: false
    end

    add_index :users, :session_token, unique: true
    add_index :users, :uid
  end
end
