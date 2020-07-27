class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
  	change_column :work_outs, :body,:text, null: true
  end

  def down
  	change_column :work_outs, :body,:text, null: false
  end
end
