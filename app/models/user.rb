class User < ActiveRecord::Base
  has_many :tweets

  validates :handle, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end
