class CreateContentFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :content_followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.timestamps
    end
  end
end
