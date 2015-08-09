class GroupsController < ApplicationController

  def index
    flash[:notice] = "早安！"
    flash[:alert] = "晚安！該睡了！"
    flash[:warning] = "測試Warning"
  end

end
