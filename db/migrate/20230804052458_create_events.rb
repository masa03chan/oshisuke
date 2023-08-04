class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.references :user, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.string :place, null: false
      t.datetime :date, null: false
      t.string :caption, null: false
      t.string :links, null: false

      t.timestamps
    end
  end
end
