# Reference: http://courses.growthschool.com/courses/rails-101/lectures/229615
class GroupsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :edit, :create, :update, :destroy]

  # 將所有查詢群組的程式碼收編至 find_group
  before_action :find_group, only:[:edit, :update, :destroy]
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
  #  @group = Group.find(params[:id])
  end

  def create
    @group = current_user.groups.create(group_params)

    if @group.save
      redirect_to groups_path, notice: '新增群組成功！'
    else
    #  flash.now[:alert] = '幹！標題是不會寫喔？'
      render :new
    end
  end

  def update
  #  @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice:'編輯討論版成功！'
    else
      render :edit
    end
  end

  def destroy
  #  @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert:'討論版已經刪除！'
  end
# 以下為擴充method

  def join
    @group = Group.find(params[:id])

    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "加入本討論版群組成功！"
    else
      flash[:warning] = "您已經是本討論版群組成員囉！"
    end
    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:notice] = "您已經退出本討論版群組！"
    else
      flash[:warning] = "你不是本討論版成員，怎麼退出 XD"
    end
    redirect_to group_path(@group)
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end

  private
  def find_group
  #  @group = Group.find(params[:id])
    #只有作者才能有 group 的修改/刪除權限
    @group = current_user.groups.find(params[:id])
  end

end
