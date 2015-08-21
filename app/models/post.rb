class Post < ActiveRecord::Base
  belongs_to :group
  vaildates :content, presence: true
end
