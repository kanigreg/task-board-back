class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :is_completed
      t.integer :project_id

      t.timestamps
    end
  end
end
