require 'spec_helper'

describe "arts/new" do
  before(:each) do
    assign(:art, stub_model(Art,
      :yubikey => "MyText",
      :user => nil,
      :book => nil
    ).as_new_record)
  end

  it "renders new art form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => arts_path, :method => "post" do
      assert_select "textarea#art_yubikey", :name => "art[yubikey]"
      assert_select "input#art_user", :name => "art[user]"
      assert_select "input#art_book", :name => "art[book]"
    end
  end
end
