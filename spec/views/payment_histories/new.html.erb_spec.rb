require 'spec_helper'

describe "payment_histories/new" do
  before(:each) do
    assign(:payment_history, stub_model(PaymentHistory,
      :customer => "MyString",
      :items => "MyString",
      :total => "MyString"
    ).as_new_record)
  end

  it "renders new payment_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payment_histories_path, :method => "post" do
      assert_select "input#payment_history_customer", :name => "payment_history[customer]"
      assert_select "input#payment_history_items", :name => "payment_history[items]"
      assert_select "input#payment_history_total", :name => "payment_history[total]"
    end
  end
end
