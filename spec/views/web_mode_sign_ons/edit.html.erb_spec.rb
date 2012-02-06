require 'spec_helper'

describe "web_mode_sign_ons/edit" do
  before(:each) do
    @web_mode_sign_on = assign(:web_mode_sign_on, stub_model(WebModeSignOn,
      :name => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit web_mode_sign_on form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => web_mode_sign_ons_path(@web_mode_sign_on), :method => "post" do
      assert_select "input#web_mode_sign_on_name", :name => "web_mode_sign_on[name]"
      assert_select "input#web_mode_sign_on_password", :name => "web_mode_sign_on[password]"
    end
  end
end
