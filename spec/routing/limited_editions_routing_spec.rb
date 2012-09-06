require "spec_helper"

describe LimitedEditionsController do
  describe "routing" do

    it "routes to #index" do
      get("/limited_editions").should route_to("limited_editions#index")
    end

    it "routes to #new" do
      get("/limited_editions/new").should route_to("limited_editions#new")
    end

    it "routes to #show" do
      get("/limited_editions/1").should route_to("limited_editions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/limited_editions/1/edit").should route_to("limited_editions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/limited_editions").should route_to("limited_editions#create")
    end

    it "routes to #update" do
      put("/limited_editions/1").should route_to("limited_editions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/limited_editions/1").should route_to("limited_editions#destroy", :id => "1")
    end

  end
end
