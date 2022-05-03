class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :Text
      t.date :UpdatedAt, default: Date.today
      t.date :CreatedAt, default: Date.today

      t.timestamps
    end
  end
end
