class ChangeBodyDefaultOnComments < ActiveRecord::Migration[5.2]
  def up
  	change_column :comments, :body,:text, null: true
  end

  def down
  	change_column :comments, :body,:text, null: false
  end
end
