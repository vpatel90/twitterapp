class UsersController < ApplicationController
  def index
  end

  def show
    @user = get_user_at_id
  end

  private

  def get_user_at_id
    User.find_by(id: params["id"].to_i)
  end
end
