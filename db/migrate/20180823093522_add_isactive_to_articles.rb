class AddIsactiveToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :isactive, :integer
  end
end
