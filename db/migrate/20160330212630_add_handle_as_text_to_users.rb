class AddHandleAsTextToUsers < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string
    change_column :tweets, :body, :string
  end
end
