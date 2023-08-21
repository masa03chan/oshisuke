class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :end_user_id, null: false
      t.integer :event_id, null: false
      t.integer :content_id, null: false
      t.timestamps
    end
  end
end
