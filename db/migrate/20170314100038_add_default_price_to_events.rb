class AddDefaultPriceToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :price, :decimal, default: 0
  end
end
