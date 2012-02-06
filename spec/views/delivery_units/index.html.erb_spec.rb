require 'spec_helper'

describe "delivery_units/index.html.erb" do
  before(:each) do
    assign(:delivery_units, [
      stub_model(DeliveryUnit,
        :manufacturer => "Manufacturer",
        :unit_model => "Unit Model",
        :desc => "MyText",
        :prefix_serial => "Prefix Serial",
        :delivery => nil
      ),
      stub_model(DeliveryUnit,
        :manufacturer => "Manufacturer",
        :unit_model => "Unit Model",
        :desc => "MyText",
        :prefix_serial => "Prefix Serial",
        :delivery => nil
      )
    ])
  end

  it "renders a list of delivery_units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Model".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Prefix Serial".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
