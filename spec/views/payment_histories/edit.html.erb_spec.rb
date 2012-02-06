require 'spec_helper'

describe "payment_histories/edit" do
  before(:each) do
    @payment_history = assign(:payment_history, stub_model(PaymentHistory,
      :customer => "MyString",
      :items => "MyString",
      :total => "MyString"
    ))
  end

  it "renders the edit payment_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payment_histories_path(@payment_history), :method => "post" do
      assert_select "input#payment_history_customer", :name => "payment_history[customer]"
      assert_select "input#payment_history_items", :name => "payment_history[items]"
      assert_select "input#payment_history_total", :name => "payment_history[total]"
    end
  end
end
