class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.belongs_to :teacher, foreign_key: true, null: false

      t.timestamps
    end
  end
end
