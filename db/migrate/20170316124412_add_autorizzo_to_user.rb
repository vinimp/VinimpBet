class AddAutorizzoToUser < ActiveRecord::Migration
  def change
    add_column :users, :autorizzo, :boolean, default: false
  end
end
