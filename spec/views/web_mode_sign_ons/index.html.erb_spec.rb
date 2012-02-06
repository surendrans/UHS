require 'spec_helper'

describe "web_mode_sign_ons/index" do
  before(:each) do
    assign(:web_mode_sign_ons, [
      stub_model(WebModeSignOn,
        :name => "Name",
        :password => "Password"
      ),
      stub_model(WebModeSignOn,
        :name => "Name",
        :password => "Password"
      )
    ])
  end

  it "renders a list of web_mode_sign_ons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
