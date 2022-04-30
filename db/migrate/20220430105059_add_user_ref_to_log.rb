class AddUserRefToLog < ActiveRecord::Migration[7.0]
  def change
    add_reference :logs, :user, null: false, foreign_key: true
  end
end
