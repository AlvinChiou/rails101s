# Reference: http://courses.growthschool.com/courses/rails-101/lectures/229615
class GroupsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :edit, :create, :update, :destroy]

  # 將所有查詢群組的程式碼收編至 find_group
  before_action :find_group, only:[:show, :edit, :update, :destroy]
  def index
    #flash[:notice] = "早安！"
    # flash[:alert] = "晚安！該睡了！"
    # flash[:warning] = "測試Warning"

    @groups = Group.all
  end

  def show
  #  @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = current_user.groups.new
  end

  def edit
  #  @group = Group.find(params[:id])
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
