class GroupsController < ApplicationController

  def index
    #flash[:notice] = "早安！"
    # flash[:alert] = "晚安！該睡了！"
    # flash[:warning] = "測試Warning"

    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.create(group_params)

    if @group.save
      redirect_to groups_path, notice: '新增群組成功！'
    else
      render :new
    end
  end

  def update
    
  end

  def destroy
    
  end
# 以下為擴充method
  private
  def group_params
    params.require(:group).permit(:title, :description)
  end

end
