class AddApplicationDateToOppourtunities < ActiveRecord::Migration[6.0]
  def change
    add_column :oppourtunities, :application_date, :datetime
  end
end
