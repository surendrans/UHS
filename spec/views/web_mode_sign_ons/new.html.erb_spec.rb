require 'spec_helper'

describe "web_mode_sign_ons/new" do
  before(:each) do
    assign(:web_mode_sign_on, stub_model(WebModeSignOn,
      :name => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new web_mode_sign_on form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => web_mode_sign_ons_path, :method => "post" do
      assert_select "input#web_mode_sign_on_name", :name => "web_mode_sign_on[name]"
      assert_select "input#web_mode_sign_on_password", :name => "web_mode_sign_on[password]"
    end
  end
end
