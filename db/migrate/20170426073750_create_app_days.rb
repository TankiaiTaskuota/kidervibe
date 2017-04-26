class CreateAppDays < ActiveRecord::Migration[5.1]
  def change
    create_table :app_days do |t|
      t.references :childern, foreign_key: true
      t.text :comment
      t.string :thema
      t.integer :outdoors
      t.integer :sleep
      t.integer :food

      t.timestamps
    end
  end
end
