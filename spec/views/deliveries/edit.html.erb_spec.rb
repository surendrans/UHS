require 'spec_helper'

describe "deliveries/edit.html.erb" do
  before(:each) do
    @delivery = assign(:delivery, stub_model(Delivery,
      :transfer_no => 1,
      :ordered_by => "MyString",
      :delivery_note => "MyText",
      :po_no => 1,
      :pickup => nil,
      :phone_no => 1,
      :address => "MyText"
    ))
  end

  it "renders the edit delivery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => deliveries_path(@delivery), :method => "post" do
      assert_select "input#delivery_transfer_no", :name => "delivery[transfer_no]"
      assert_select "input#delivery_ordered_by", :name => "delivery[ordered_by]"
      assert_select "textarea#delivery_delivery_note", :name => "delivery[delivery_note]"
      assert_select "input#delivery_po_no", :name => "delivery[po_no]"
      assert_select "input#delivery_pickup", :name => "delivery[pickup]"
      assert_select "input#delivery_phone_no", :name => "delivery[phone_no]"
      assert_select "textarea#delivery_address", :name => "delivery[address]"
    end
  end
end
