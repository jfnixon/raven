require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :author => "MyText",
      :image => "MyText",
      :signing => nil
    ))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path(@book), :method => "post" do
      assert_select "textarea#book_author", :name => "book[author]"
      assert_select "textarea#book_image", :name => "book[image]"
      assert_select "input#book_signing", :name => "book[signing]"
    end
  end
end
