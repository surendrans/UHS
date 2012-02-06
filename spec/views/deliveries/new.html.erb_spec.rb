require 'spec_helper'

describe "deliveries/new.html.erb" do
  before(:each) do
    assign(:delivery, stub_model(Delivery,
      :transfer_no => 1,
      :ordered_by => "MyString",
      :delivery_note => "MyText",
      :po_no => 1,
      :pickup => nil,
      :phone_no => 1,
      :address => "MyText"
    ).as_new_record)
  end

  it "renders new delivery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => deliveries_path, :method => "post" do
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
