class Account::PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = current_user.posts
    #@posts = current_user.participated_posts
  end

end

class PostsController < ApplicationController

  #before_action指定的行為通常是這個Controller所有method都會執行的第一件事，是一種AOP的實作
  before_action :authenticate_user!

  before_action :find_group
  # before_action: find_group, only: [:edit, :update] 可以用 only,指定某些 action 執行

  # before_action: find_group, except: [:show, :index] 或者使用 except,排除某些 action 不執行

  before_action :current_user_posts, only:[:edit, :update, :destroy]

  before_action :member_required, only:[:new, :create]

  def new
    @post = @group.posts.new
  end

  def edit
    # @post = @group.posts.find(params[:id])
  end

  def create
    @post = @group.posts.build(post_params)

    @post.author = current_user

    if @post.save
      redirect_to group_path(@group), notice: "新增文章成功！"
    else
      render :new
    end
  end

  def update
    # @post = @group.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to group_path(@group), notice:"文章修改成功！"
    else
      render :edit
    end
  end

  def destroy
    #先驗證這個 group 裡面是否有這個 post，如果有就刪除
  #  @post = @group.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), alert:"文章已刪除"
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  private
  def find_group
    @group = Group.find(params[:group_id])
  end

  private
  def current_user_posts
    @post = current_user.posts.find(params[:id])
  end

  # user 必須要是這個社團的成員才能發表文章
  private
  def member_required
    if !current_user.is_member_of?(@group)
      flash[:warning]="你不是這個討論版的成員，不能發文喔！"
      redirect_to group_path(@group)
    end
  end

end
