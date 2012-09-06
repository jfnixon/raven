require 'spec_helper'

describe "limited_editions/index" do
  before(:each) do
    assign(:limited_editions, [
      stub_model(LimitedEdition,
        :title => "Title",
        :creator => "Creator",
        :yubi_otp => "Yubi Otp"
      ),
      stub_model(LimitedEdition,
        :title => "Title",
        :creator => "Creator",
        :yubi_otp => "Yubi Otp"
      )
    ])
  end

  it "renders a list of limited_editions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
    assert_select "tr>td", :text => "Yubi Otp".to_s, :count => 2
  end
end
