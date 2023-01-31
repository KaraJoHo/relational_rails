class AddTimestampsToPlanets < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:planets, null:false)
  end
end
