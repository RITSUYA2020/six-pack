class ChangeBodyDefaultOnWorkOuts < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :work_outs, :body, from: "", to: nil
  end
end
