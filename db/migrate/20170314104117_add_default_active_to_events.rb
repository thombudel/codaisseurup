class AddDefaultActiveToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :active, :boolean, default:true
  end
end
