class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :body
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :parent_tweet_id

      t.timestamps null: false
    end
  end
end
