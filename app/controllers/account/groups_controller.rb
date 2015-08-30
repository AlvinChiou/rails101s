class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.participated_groups.order(post_count: :desc)
  end
end
