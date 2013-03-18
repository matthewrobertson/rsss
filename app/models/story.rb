class Story < ActiveRecord::Base
  attr_accessible :link_id, :user_id

  belongs_to :link
  belongs_to :story

  def as_json(options = {})
    story_json = super options
    if link
      link.as_json(options).merge!(story_json)
    else
      story_json
    end
  end

  def to_xml(options = {})
    as_json(options).to_xml
  end

end
