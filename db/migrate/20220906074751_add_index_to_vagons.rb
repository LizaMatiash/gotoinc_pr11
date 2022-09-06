class AddIndexToVagons < ActiveRecord::Migration[6.1]
  def change
    add_index :vagons, [:id, :type]
  end
end
