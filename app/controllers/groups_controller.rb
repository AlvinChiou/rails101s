class GroupsController < ApplicationController

  def index
    #flash[:notice] = "早安！"
    # flash[:alert] = "晚安！該睡了！"
    # flash[:warning] = "測試Warning"

    @groups = Group.all
  end

  def show
    
  end

  def new
    
  end

  def edit
    
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end

end
