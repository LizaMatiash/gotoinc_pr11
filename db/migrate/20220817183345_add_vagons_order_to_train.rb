class AddVagonsOrderToTrain < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :vagon_order, :boolean, default: false
  end
end
