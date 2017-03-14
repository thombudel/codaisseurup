class AddDefaultFoodToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :includes_food, :boolean, default:false
  end
end
