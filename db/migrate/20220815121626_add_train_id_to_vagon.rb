class AddTrainIdToVagon < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :vagons, :train
  end
end
