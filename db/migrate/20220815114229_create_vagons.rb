class CreateVagons < ActiveRecord::Migration[6.1]
  def change
    create_table :vagons do |t|
      t.integer :vagon_id
      t.integer :order_v
      t.integer :places_up
      t.integer :places_down
      t.integer :side_places_up
      t.integer :side_places_down
      t.integer :sitting_places
      t.string :type

      t.references :train

      t.timestamps
    end
  end
end
