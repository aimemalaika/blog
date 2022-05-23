class CreateAllowlistedJwts < ActiveRecord::Migration[7.0]
  def change
    create_table :allowlisted_jwts do |t|
      t.string :jti
      t.string :aud
      t.datetime :datetime
      t.references :users, :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
