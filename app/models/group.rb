class Group < ActiveRecord::Base
  validates :title, presence: true
  # validates :title, presence: {message: '幹！標題是不會寫喔？'}
  has_many :posts
  has_many :group_users
  has_many :members, through: :group_users, source: :user
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  # 只有作者才會出現 edit / delete 按鈕
  def editable_by?(user)
    user && user == owner
  end

end
