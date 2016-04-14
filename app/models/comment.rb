class Comment < ActiveRecord::Base
  belongs_to :user
  attr_protected :user_id, :posts # see text
end