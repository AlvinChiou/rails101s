class GroupsController < ApplicationController

  def index
    #flash[:notice] = "早安！"
    # flash[:alert] = "晚安！該睡了！"
    # flash[:warning] = "測試Warning"

    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
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
    #  flash.now[:alert] = '幹！標題是不會寫喔？'
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice:'編輯討論版成功！'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert:'討論版已經刪除！'
  end
# 以下為擴充method
  private
  def group_params
    params.require(:group).permit(:title, :description)
  end

end
