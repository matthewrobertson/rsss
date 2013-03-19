class Story < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :link
  belongs_to :story

  default_scope order('created_at desc')
  scope :unread, where(:is_read => false)

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
