class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.belongs_to :week
      t.belongs_to :user
      t.json :assigns

      t.timestamps
    end
  end
end
