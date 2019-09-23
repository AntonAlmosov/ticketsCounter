class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :sum
      t.integer :normal
      t.integer :share
      t.integer :normalDrink
      t.integer :shareDrink
      
      t.timestamps
    end
  end
end
