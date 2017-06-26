class CreateClassificas < ActiveRecord::Migration
  def change
    create_table :classificas do |t|
      t.integer :user_id
      t.integer :n_giornata
      t.decimal :punteggio

      t.timestamps null: false
    end
  end
end
