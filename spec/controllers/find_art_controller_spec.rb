require 'spec_helper'

describe FindArtController do

  describe "GET 'find'" do
    it "returns http success" do
      get 'find'
      response.should be_success
    end
  end

end
