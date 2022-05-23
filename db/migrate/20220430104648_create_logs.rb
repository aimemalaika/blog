class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.date :login_time, default: Date.today
      t.string :location

      t.timestamps
    end
  end
end
