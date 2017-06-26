class AddRisultatoToBets < ActiveRecord::Migration
  def change
    add_column :bets, :risultato, :string
  end
end
