class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
