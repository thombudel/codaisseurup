class AddDefaultDrinkToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :includes_drinks, :boolean, default:false
  end
end
