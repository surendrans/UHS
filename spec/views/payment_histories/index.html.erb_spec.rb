require 'spec_helper'

describe "payment_histories/index" do
  before(:each) do
    assign(:payment_histories, [
      stub_model(PaymentHistory,
        :customer => "Customer",
        :items => "Items",
        :total => "Total"
      ),
      stub_model(PaymentHistory,
        :customer => "Customer",
        :items => "Items",
        :total => "Total"
      )
    ])
  end

  it "renders a list of payment_histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Customer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Items".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Total".to_s, :count => 2
  end
end
