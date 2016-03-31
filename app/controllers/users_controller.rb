class UsersController < ApplicationController
  def index
  end

  def show
    @page = params[:page] || "1"
    @user = get_user_at_id
    @tweets = @user.tweets.limit(25).offset((@page.to_i - 1)*25)
  end

  private

  def get_user_at_id
    User.find_by(id: params[:id].to_i)
  end
end
