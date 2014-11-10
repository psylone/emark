class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fio
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.boolean :is_teacher, default: false

      t.references :grade

      t.timestamps
    end
  end
end
