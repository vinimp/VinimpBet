class AddSpesaTotaleVincitaTotaleToEurekas < ActiveRecord::Migration
  def change
    add_column :eurekas, :spesa_totale, :decimal
    add_column :eurekas, :vincita_totale, :decimal
  end
end
