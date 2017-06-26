class AddNgiornataToBets < ActiveRecord::Migration
  def change
    add_column :bets, :n_giornata, :integer
  end
end
