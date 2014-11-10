class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :value

      t.references :subject_line

      t.timestamps
    end

    add_index :marks, :subject_line_id
  end
end
