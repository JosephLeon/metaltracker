class AddCountToSilvers < ActiveRecord::Migration
  def change
    add_column :silvers, :count, :integer
  end
end
