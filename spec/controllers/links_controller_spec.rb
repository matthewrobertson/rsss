require 'spec_helper'

describe LinksController do

  describe 'all actions' do

    it 'set the CORS headers' do
      get :index
      response.headers['Access-Control-Allow-Origin'].should == 'http://localhost:3000'
    end

    it 'return a 404 if the user is not logged in' do
      get :index
      response.status.should == 404
    end

  end


  describe '#index' do

  end

  describe '#batch' do
    it 'updates all the users stories' do
      controller.stub_chain(:current_user, :stories).and_return(Story)
      story1 = Story.create!
      story2 = Story.create!
      post :batch, :is_read => true
      story1.reload.is_read.should be_true
      story2.reload.is_read.should be_true
    end
  end

  describe '#show' do

  end

  describe '#update' do

    it 'finds the story and updates it' do
      controller.stub_chain(:current_user, :stories).and_return(Story)
      story = Story.create!
      post :update, :id => story.id, :is_read => true
      story.reload.is_read.should be_true
    end

  end

end