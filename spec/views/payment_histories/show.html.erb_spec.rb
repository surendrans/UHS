require 'spec_helper'

describe "payment_histories/show" do
  before(:each) do
    @payment_history = assign(:payment_history, stub_model(PaymentHistory,
      :customer => "Customer",
      :items => "Items",
      :total => "Total"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Customer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Items/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Total/)
  end
end
