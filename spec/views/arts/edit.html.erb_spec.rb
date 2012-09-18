require 'spec_helper'

describe "arts/edit" do
  before(:each) do
    @art = assign(:art, stub_model(Art,
      :yubikey => "MyText",
      :user => nil,
      :book => nil
    ))
  end

  it "renders the edit art form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => arts_path(@art), :method => "post" do
      assert_select "textarea#art_yubikey", :name => "art[yubikey]"
      assert_select "input#art_user", :name => "art[user]"
      assert_select "input#art_book", :name => "art[book]"
    end
  end
end
