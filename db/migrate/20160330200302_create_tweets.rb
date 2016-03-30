class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :body
      t.belongs_to :User, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
