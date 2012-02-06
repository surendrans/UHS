require "spec_helper"

describe PaymentHistoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/payment_histories").should route_to("payment_histories#index")
    end

    it "routes to #new" do
      get("/payment_histories/new").should route_to("payment_histories#new")
    end

    it "routes to #show" do
      get("/payment_histories/1").should route_to("payment_histories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payment_histories/1/edit").should route_to("payment_histories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payment_histories").should route_to("payment_histories#create")
    end

    it "routes to #update" do
      put("/payment_histories/1").should route_to("payment_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payment_histories/1").should route_to("payment_histories#destroy", :id => "1")
    end

  end
end
