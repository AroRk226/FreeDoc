class AddIndexToPatients < ActiveRecord::Migration[6.0]
  def change
  	add_reference :patients, :city, foreign_key: true
  end
end
