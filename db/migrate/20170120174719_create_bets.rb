class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :evento
      t.decimal :vittoria
      t.decimal :pareggio
      t.decimal :sconfitta
      t.date :data

      t.timestamps null: false
    end
  end
end
