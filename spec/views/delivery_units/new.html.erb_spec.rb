require 'spec_helper'

describe "delivery_units/new.html.erb" do
  before(:each) do
    assign(:delivery_unit, stub_model(DeliveryUnit,
      :manufacturer => "MyString",
      :unit_model => "MyString",
      :desc => "MyText",
      :prefix_serial => "MyString",
      :delivery => nil
    ).as_new_record)
  end

  it "renders new delivery_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => delivery_units_path, :method => "post" do
      assert_select "input#delivery_unit_manufacturer", :name => "delivery_unit[manufacturer]"
      assert_select "input#delivery_unit_unit_model", :name => "delivery_unit[unit_model]"
      assert_select "textarea#delivery_unit_desc", :name => "delivery_unit[desc]"
      assert_select "input#delivery_unit_prefix_serial", :name => "delivery_unit[prefix_serial]"
      assert_select "input#delivery_unit_delivery", :name => "delivery_unit[delivery]"
    end
  end
end
