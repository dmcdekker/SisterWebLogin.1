class Comment < ActiveRecord::Base
  belongs_to :user
  attr_protected :user_id, :posts # see text
  validates_presence_of :user_id
end