require 'spec_helper'

describe Story do

  describe '#as_json' do
    before do
      @story = Story.create
      @link = @story.create_link({
        :title => 'Foo Bar',
        :url   => 'http://foobar.com',
        :content_type => 'text/html',
        :host => 'foobar.com'
      })
    end

    it 'merges its json attrs with its links json' do
      json = @story.as_json
      json['url'].should eq @link.url
      json['id'].should eq @story.id
    end

  end

end