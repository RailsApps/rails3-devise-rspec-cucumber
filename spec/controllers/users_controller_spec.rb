require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = Factory.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id => @user.id
      response.should be_success
    end
  end

end
