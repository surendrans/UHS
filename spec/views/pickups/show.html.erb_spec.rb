require 'spec_helper'

describe "pickups/show.html.erb" do
  before(:each) do
    @pickup = assign(:pickup, stub_model(Pickup,
      :name => "Name",
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
  end
end
