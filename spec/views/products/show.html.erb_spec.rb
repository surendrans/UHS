require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :price => "Price",
      :discount => "Discount",
      :barcode => "Barcode"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Price/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Discount/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Barcode/)
  end
end
