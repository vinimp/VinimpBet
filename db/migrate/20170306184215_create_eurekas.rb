class CreateEurekas < ActiveRecord::Migration
  def change
    create_table :eurekas do |t|
      t.string :evento1
      t.string :evento2
      t.decimal :unouno
      t.decimal :unox
      t.decimal :x
      t.decimal :due

      t.timestamps null: false
    end
  end
end
