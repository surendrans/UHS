require 'spec_helper'

describe "deliveries/index.html.erb" do
  before(:each) do
    assign(:deliveries, [
      stub_model(Delivery,
        :transfer_no => 1,
        :ordered_by => "Ordered By",
        :delivery_note => "MyText",
        :po_no => 1,
        :pickup => nil,
        :phone_no => 1,
        :address => "MyText"
      ),
      stub_model(Delivery,
        :transfer_no => 1,
        :ordered_by => "Ordered By",
        :delivery_note => "MyText",
        :po_no => 1,
        :pickup => nil,
        :phone_no => 1,
        :address => "MyText"
      )
    ])
  end

  it "renders a list of deliveries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ordered By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
