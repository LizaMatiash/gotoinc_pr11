class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :train
      t.belongs_to :user
      t.belongs_to :base_station
      t.belongs_to :end_station
      t.text :lastname
      t.text :firstname
      t.integer :passport_id
      # t.timestamps
    end
  end
end
