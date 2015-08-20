class CreateSnoozes < ActiveRecord::Migration
  def change
    create_table :snoozes do |t|
      t.integer :deal_id
      t.date :next_alarm
      t.text :description
    end
  end
end
