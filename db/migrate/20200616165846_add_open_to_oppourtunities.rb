class AddOpenToOppourtunities < ActiveRecord::Migration[6.0]
  def change
    add_column :oppourtunities, :open, :boolean, default: true
  end
end
