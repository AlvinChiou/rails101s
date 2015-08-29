class AddPostsToGroup < ActiveRecord::Migration
  def change
    # 設定 default:0 讓資料庫被新增的欄位顯示0而不會顯示null
    add_column :groups, :post_count, :integer, default: 0
  end
end
