class AddVincitaToEurekas < ActiveRecord::Migration
  def change
    add_column :eurekas, :vincita, :decimal
  end
end
