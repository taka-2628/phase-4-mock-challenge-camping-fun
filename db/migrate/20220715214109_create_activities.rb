class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :difficulty
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
