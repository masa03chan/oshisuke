class CreateContentFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :content_followings do |t|
      t.integer :end_user_id, null: false
      t.integer :content_id, null: false
      t.timestamps
    end
  end
end
