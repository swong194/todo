class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.date :due_date, null: false
      t.integer :board_id, null: false
      t.integer :category_id, null: false
      t.integer :assignee_id
      t.timestamps
    end
  end
end
