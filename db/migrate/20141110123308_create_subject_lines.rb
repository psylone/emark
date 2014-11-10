class CreateSubjectLines < ActiveRecord::Migration
  def change
    create_table :subject_lines do |t|
      t.references :subject
      t.references :user

      t.timestamps
    end

    add_index :subject_lines, [ :subject_id, :user_id ]
  end
end
