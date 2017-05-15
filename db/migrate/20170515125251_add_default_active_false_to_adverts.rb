class AddDefaultActiveFalseToAdverts < ActiveRecord::Migration[5.1]
  def change
    change_column :adverts, :active, :boolean, default: false
  end
end
