class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :icon_img, :string
    add_column :users, :introduction, :string
  end
end
