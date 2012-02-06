require 'spec_helper'

describe "web_mode_sign_ons/show" do
  before(:each) do
    @web_mode_sign_on = assign(:web_mode_sign_on, stub_model(WebModeSignOn,
      :name => "Name",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password/)
  end
end
