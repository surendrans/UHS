require "spec_helper"

describe DeliveryUnitsController do
  describe "routing" do

    it "routes to #index" do
      get("/delivery_units").should route_to("delivery_units#index")
    end

    it "routes to #new" do
      get("/delivery_units/new").should route_to("delivery_units#new")
    end

    it "routes to #show" do
      get("/delivery_units/1").should route_to("delivery_units#show", :id => "1")
    end

    it "routes to #edit" do
      get("/delivery_units/1/edit").should route_to("delivery_units#edit", :id => "1")
    end

    it "routes to #create" do
      post("/delivery_units").should route_to("delivery_units#create")
    end

    it "routes to #update" do
      put("/delivery_units/1").should route_to("delivery_units#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/delivery_units/1").should route_to("delivery_units#destroy", :id => "1")
    end

  end
end
