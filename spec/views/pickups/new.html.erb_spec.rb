require 'spec_helper'

describe "pickups/new.html.erb" do
  before(:each) do
    assign(:pickup, stub_model(Pickup,
      :name => "MyString",
      :code => "MyString"
    ).as_new_record)
  end

  it "renders new pickup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pickups_path, :method => "post" do
      assert_select "input#pickup_name", :name => "pickup[name]"
      assert_select "input#pickup_code", :name => "pickup[code]"
    end
  end
end
