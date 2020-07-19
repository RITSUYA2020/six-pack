class CreateWorkOutComments < ActiveRecord::Migration[5.2]
  def change
    create_table :work_out_comments do |t|
      t.integer :work_out_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
