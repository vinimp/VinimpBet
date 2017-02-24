class AddPuntateToEurekas < ActiveRecord::Migration
  def change
    add_column :eurekas, :puntata11, :decimal
    add_column :eurekas, :puntata1x, :decimal
    add_column :eurekas, :puntatax, :decimal
    add_column :eurekas, :puntata2, :decimal
  end
end
