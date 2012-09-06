require 'spec_helper'

describe "limited_editions/show" do
  before(:each) do
    @limited_edition = assign(:limited_edition, stub_model(LimitedEdition,
      :title => "Title",
      :creator => "Creator",
      :yubi_otp => "Yubi Otp"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Creator/)
    rendered.should match(/Yubi Otp/)
  end
end
