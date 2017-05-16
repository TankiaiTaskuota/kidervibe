class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :thread_app_id
      t.integer :post_app_id
      t.string :attachment_url
      t.text :info
      t.string :sender_name
      t.integer :sender_app_id

      t.timestamps
    end
  end
end
