class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.boolean :status, null: false, default: 0
      t.string :thumbnail, null: false
      t.string :caption, null: false
      t.string :public_link, null: false
      t.timestamps
    end
  end
end
