class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :head_master
      t.string :academic_head
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
