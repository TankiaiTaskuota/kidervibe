class CreateChilderns < ActiveRecord::Migration[5.1]
  def change
    create_table :childerns do |t|
      t.string :name
      t.integer :app_id

      t.timestamps
    end
  end
end
