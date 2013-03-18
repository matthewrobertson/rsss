require 'spec_helper'

describe LinksController do

  describe 'all actions' do

    describe 'options request verb' do

      before do
        controller.request.stub(:method).and_return(:options)
      end
      it 'sets the CORS headers' do
        get :index
        response.headers['Access-Control-Allow-Origin'].should == '*'
        response.headers['Access-Control-Allow-Headers'].should ==
          'X-Requested-With, X-Prototype-Version'
        response.should be_success
      end
    end

    it 'return a 404 if the user is not logged in' do
      get :index
      response.status.should == 404
      post :batch
      response.status.should == 404
      get :show, :id => 3
      response.status.should == 404
      post :update, :id => 3
      response.status.should == 404
    end

  end


  describe '#index' do
  end

  describe '#batch' do
  end

  describe '#show' do
  end

  describe '#update' do
  end

end