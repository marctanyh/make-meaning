class AddConclusionToOppourtunities < ActiveRecord::Migration[6.0]
  def change
    add_column :oppourtunities, :conclusion, :text
  end
end
