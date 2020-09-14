class AddCommentToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :comment, :string
    add_column :cocktails, :string, :string
  end
end
