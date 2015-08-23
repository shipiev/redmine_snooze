class CreateSnoozes < ActiveRecord::Migration
  def change
    create_table :snoozes do |t|
      # Приходится дублировать, так как связь между note и order -- полиморфная
      t.integer :note_id
      t.integer :deal_id
      t.boolean :active
      t.date :deadline_on
      t.integer :created_by_id
    end
  end
end
