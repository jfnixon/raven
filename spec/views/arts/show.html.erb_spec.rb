require 'spec_helper'

describe "arts/show" do
  before(:each) do
    @art = assign(:art, stub_model(Art,
      :yubikey => "MyText",
      :user => nil,
      :book => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
