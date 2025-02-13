class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.date :date
      t.float :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
