class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :content_id, null: false
      t.string :place, null: false
      t.string :caption, null: false
      t.string :links, null: false

      t.timestamps
    end
  end
end
