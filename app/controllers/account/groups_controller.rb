class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order("updated_at DESC")
    #@posts = current_user.participated_posts
  end
end
