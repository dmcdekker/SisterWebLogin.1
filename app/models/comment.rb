# == Schema Information
#
# Table name: comments
#
#  id          :integer         not null, primary key
#  content     :string
#  userblog_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Comment < ActiveRecord::Base
  belongs_to :userblog
  attr_accessible :content, :userblog_id
  
  validates :content, :presence => true 

  validates :content, :uniqueness => { :scope => :userblog_id }  
end
