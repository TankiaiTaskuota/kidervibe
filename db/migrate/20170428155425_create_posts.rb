class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :app_id
      t.string :attachment_url
      t.text :info

      t.timestamps
    end
  end
end
