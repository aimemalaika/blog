class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.date :CreatedAt, default: Date.today
      t.date :UpdatedAt, default: Date.today

      t.timestamps
    end
  end
end
