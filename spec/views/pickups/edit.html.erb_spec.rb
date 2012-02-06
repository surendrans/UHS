require 'spec_helper'

describe "pickups/edit.html.erb" do
  before(:each) do
    @pickup = assign(:pickup, stub_model(Pickup,
      :name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders the edit pickup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pickups_path(@pickup), :method => "post" do
      assert_select "input#pickup_name", :name => "pickup[name]"
      assert_select "input#pickup_code", :name => "pickup[code]"
    end
  end
end
