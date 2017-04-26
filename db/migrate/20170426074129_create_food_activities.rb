class CreateFoodActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :food_activities do |t|
      t.references :childern, foreign_key: true
      t.references :food, foreign_key: true
      t.integer :food_type
      t.float :percentage

      t.timestamps
    end
  end
end
