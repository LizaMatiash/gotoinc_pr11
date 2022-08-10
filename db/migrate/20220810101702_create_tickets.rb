class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :train
      t.belongs_to :base_station
      t.belongs_to :end_station
      # t.timestamps
    end
  end
end
