class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :planets, :type, :planet_type
  end
end
