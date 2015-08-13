class Group < ActiveRecord::Base
  validates :title, presence: true
  # validates :title, presence: {message: '幹！標題是不會寫喔？'}
end
