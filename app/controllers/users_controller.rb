class UsersController < ApplicationController
  def index
    @page = params[:page] || "1"
    if params[:search].nil?
      @users = get_users
    else
      @users = get_users_by_search
    end
  end

  def show
    @page = params[:page] || "1"
    @user = get_user_at_id
    if params[:search].nil?
      @tweets = @user.tweets.order(updated_at: :desc).limit(25).offset((@page.to_i - 1)*25)
    else
      @tweets = @user.tweets.where("body LIKE '%#{params[:search]}%'").order(updated_at: :desc).limit(25).offset((@page.to_i - 1)*25)
    end
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def get_user_at_id
    User.find_by(id: params[:id].to_i)
  end

  def get_users
    User.limit(25).offset((@page.to_i - 1)*25)
  end

  def get_users_by_search
    User.where("first_name LIKE '%#{params[:search]}%'").limit(25).offset((@page.to_i - 1)*25)
  end
end
