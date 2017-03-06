class AddSpesaVincitaToEurekas < ActiveRecord::Migration
  def change
    add_column :eurekas, :spesa, :decimal
    add_column :eurekas, :vincita_lorda, :decimal
  end
end
