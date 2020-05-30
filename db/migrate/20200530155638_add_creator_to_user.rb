class AddCreatorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :creator, :boolean, default: false, null: false
  end
end
