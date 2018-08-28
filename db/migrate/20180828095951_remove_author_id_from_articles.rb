class RemoveAuthorIdFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :author_id, :integer
  end
end
