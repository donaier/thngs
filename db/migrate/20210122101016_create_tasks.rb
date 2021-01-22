class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.text :text
      t.integer :creator
      t.datetime :completed_at
      t.integer :completed_from

      t.timestamps
    end
  end
end
