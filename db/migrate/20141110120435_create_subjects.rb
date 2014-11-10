class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title

      t.references :user
      t.references :grade

      t.timestamps
    end

    add_index :subjects, :user_id
    add_index :subjects, :grade_id
  end
end
