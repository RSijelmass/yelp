class AddScoreToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :score, :integer
  end
end
