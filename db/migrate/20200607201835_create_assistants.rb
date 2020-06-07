class CreateAssistants < ActiveRecord::Migration[6.0]
  def change
    create_table :assistants do |t|
      t.integer :count
      t.timestamps
    end
  end
end
