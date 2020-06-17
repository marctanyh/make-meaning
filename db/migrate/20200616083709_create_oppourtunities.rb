class CreateOppourtunities < ActiveRecord::Migration[6.0]
  def change
    create_table :oppourtunities do |t|
      t.references :account
      t.string :name
      t.text   :body
      t.string :photo

      t.timestamps
    end
  end
end
