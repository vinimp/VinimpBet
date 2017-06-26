class AddChiusuraToBetPuntates < ActiveRecord::Migration
  def change
    add_column :bet_puntates, :chiusura, :boolean, default: false
  end
end
