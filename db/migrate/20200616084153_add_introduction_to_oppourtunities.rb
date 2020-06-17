class AddIntroductionToOppourtunities < ActiveRecord::Migration[6.0]
  def change
    add_column :oppourtunities, :introduction, :text
  end
end
