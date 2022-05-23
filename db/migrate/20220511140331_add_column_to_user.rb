class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :Role, :string, default: 'user'
  end
end
