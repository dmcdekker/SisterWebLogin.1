# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  what       :text
#  where      :text
#  when       :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  attr_accessible :what, :where, :when
end
