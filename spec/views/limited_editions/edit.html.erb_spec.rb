require 'spec_helper'

describe "limited_editions/edit" do
  before(:each) do
    @limited_edition = assign(:limited_edition, stub_model(LimitedEdition,
      :title => "MyString",
      :creator => "MyString",
      :yubi_otp => "MyString"
    ))
  end

  it "renders the edit limited_edition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => limited_editions_path(@limited_edition), :method => "post" do
      assert_select "input#limited_edition_title", :name => "limited_edition[title]"
      assert_select "input#limited_edition_creator", :name => "limited_edition[creator]"
      assert_select "input#limited_edition_yubi_otp", :name => "limited_edition[yubi_otp]"
    end
  end
end
