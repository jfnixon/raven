require 'spec_helper'

describe "limited_editions/new" do
  before(:each) do
    assign(:limited_edition, stub_model(LimitedEdition,
      :title => "MyString",
      :creator => "MyString",
      :yubi_otp => "MyString"
    ).as_new_record)
  end

  it "renders new limited_edition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => limited_editions_path, :method => "post" do
      assert_select "input#limited_edition_title", :name => "limited_edition[title]"
      assert_select "input#limited_edition_creator", :name => "limited_edition[creator]"
      assert_select "input#limited_edition_yubi_otp", :name => "limited_edition[yubi_otp]"
    end
  end
end
