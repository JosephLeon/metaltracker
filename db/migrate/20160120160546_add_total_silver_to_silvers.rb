class AddTotalSilverToSilvers < ActiveRecord::Migration
  def change
  	add_column :silvers, :total_silver, :decimal
  end
end
