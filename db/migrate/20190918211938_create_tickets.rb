class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :normal
      t.integer :shared
      t.integer :normalDrink
      t.integer :sharedDrink

      t.timestamps
    end
  end
end
