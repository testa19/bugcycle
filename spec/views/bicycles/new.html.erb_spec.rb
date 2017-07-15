require 'rails_helper'

RSpec.describe "bicycles/new", type: :view do
  before(:each) do
    assign(:bicycle, Bicycle.new(
      :name => "MyString",
      :description => "MyString",
      category: create(:category)
    ))
  end

  it "renders new bicycle form" do
    render

    assert_select "form[action=?][method=?]", bicycles_path, "post" do

      assert_select "input#bicycle_name[name=?]", "bicycle[name]"

      assert_select "input#bicycle_description[name=?]", "bicycle[description]"
    end
  end
end
