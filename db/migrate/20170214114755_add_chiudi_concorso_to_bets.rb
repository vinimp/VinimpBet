class AddChiudiConcorsoToBets < ActiveRecord::Migration
  def change
    add_column :bets, :chiudi_concorso, :boolean, default: false
  end
end
