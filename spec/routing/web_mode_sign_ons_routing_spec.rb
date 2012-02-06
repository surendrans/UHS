require "spec_helper"

describe WebModeSignOnsController do
  describe "routing" do

    it "routes to #index" do
      get("/web_mode_sign_ons").should route_to("web_mode_sign_ons#index")
    end

    it "routes to #new" do
      get("/web_mode_sign_ons/new").should route_to("web_mode_sign_ons#new")
    end

    it "routes to #show" do
      get("/web_mode_sign_ons/1").should route_to("web_mode_sign_ons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/web_mode_sign_ons/1/edit").should route_to("web_mode_sign_ons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/web_mode_sign_ons").should route_to("web_mode_sign_ons#create")
    end

    it "routes to #update" do
      put("/web_mode_sign_ons/1").should route_to("web_mode_sign_ons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/web_mode_sign_ons/1").should route_to("web_mode_sign_ons#destroy", :id => "1")
    end

  end
end
