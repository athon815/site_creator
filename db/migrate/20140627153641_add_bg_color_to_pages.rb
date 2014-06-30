class AddBgColorToPages < ActiveRecord::Migration
  def change
    add_column :pages, :bgcolor, :string
  end
end
