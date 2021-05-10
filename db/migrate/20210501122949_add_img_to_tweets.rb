class AddImgToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :img, :string
  end
end
