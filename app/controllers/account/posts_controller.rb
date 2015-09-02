class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.recent
    #@posts = current_user.participated_posts
  end
end
