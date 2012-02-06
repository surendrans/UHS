require 'spec_helper'

describe "delivery_units/show.html.erb" do
  before(:each) do
    @delivery_unit = assign(:delivery_unit, stub_model(DeliveryUnit,
      :manufacturer => "Manufacturer",
      :unit_model => "Unit Model",
      :desc => "MyText",
      :prefix_serial => "Prefix Serial",
      :delivery => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Manufacturer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Model/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Prefix Serial/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
