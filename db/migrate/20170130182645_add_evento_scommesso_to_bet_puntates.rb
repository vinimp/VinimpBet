class AddEventoScommessoToBetPuntates < ActiveRecord::Migration
  def change
    add_column :bet_puntates, :evento_scommesso, :string
  end
end
