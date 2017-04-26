class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :childern, foreign_key: true
      t.text :comment
      t.string :app_id
      t.string :image_url
      t.string :image_path
      t.string :ext

      t.timestamps
    end
  end
end
