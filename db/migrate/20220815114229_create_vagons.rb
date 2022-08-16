class CreateVagons < ActiveRecord::Migration[6.1]
  def change
    create_table :vagons do |t|
      t.integer :type_v
      t.integer :places_up
      t.integer :places_down

      t.timestamps
    end
  end
end
