require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :price => "MyString",
      :discount => "MyString",
      :barcode => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_discount", :name => "product[discount]"
      assert_select "input#product_barcode", :name => "product[barcode]"
    end
  end
end
