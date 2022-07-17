class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.integer :camper_id
      t.integer :activity_id
      t.integer :time
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
