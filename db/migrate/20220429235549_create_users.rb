class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Photo
      t.text :Bio
      t.date :UpdatedAt, default: Date.today
      t.date :CreatedAt, default: Date.today
      t.integer :PostsCounter, default: 0

      t.timestamps
    end
  end
end
