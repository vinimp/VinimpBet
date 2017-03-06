class AddDataToEurekas < ActiveRecord::Migration
  def change
    add_column :eurekas, :data, :date
  end
end
