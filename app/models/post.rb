class Post < ActiveRecord::Base
  # Rails 的 Model 裡面有一個內建的 counter_cache 功能幫助你記錄
  # 只要設定好 counter_cache: :posts_count <== (你剛剛建立的欄位名稱)
  # 只要 post 有 create 跟 destroy 的動作，就會自動在 posts_count 欄位 +1 跟 -1
  belongs_to :group, counter_cache: :post_count
  validates :content, presence: true

  belongs_to :author, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == author
  end
end
