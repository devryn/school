class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.belongs_to :schooln, foreign_key: true, null: false

      t.timestamps
    end
  end
end
