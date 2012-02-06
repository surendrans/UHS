require "spec_helper"

describe PickupsController do
  describe "routing" do

    it "routes to #index" do
      get("/pickups").should route_to("pickups#index")
    end

    it "routes to #new" do
      get("/pickups/new").should route_to("pickups#new")
    end

    it "routes to #show" do
      get("/pickups/1").should route_to("pickups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pickups/1/edit").should route_to("pickups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pickups").should route_to("pickups#create")
    end

    it "routes to #update" do
      put("/pickups/1").should route_to("pickups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pickups/1").should route_to("pickups#destroy", :id => "1")
    end

  end
end
