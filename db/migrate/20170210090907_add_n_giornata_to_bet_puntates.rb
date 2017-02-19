class AddNGiornataToBetPuntates < ActiveRecord::Migration
  def change
    add_column :bet_puntates, :n_giornata, :integer
  end
end
