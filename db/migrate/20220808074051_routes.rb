class Routes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |r|
      r.string :name

      r.timestamps
    end
  end
end
