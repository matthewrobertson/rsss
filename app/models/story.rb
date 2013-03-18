class Story < ActiveRecord::Base
  attr_accessible :link_id, :user_id

  belongs_to :link
  belongs_to :story

end
