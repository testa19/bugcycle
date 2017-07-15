require 'rails_helper'

RSpec.describe "bicycles/edit", type: :view do
  before(:each) do
    @bicycle = assign(:bicycle, Bicycle.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit bicycle form" do
    render

    assert_select "form[action=?][method=?]", bicycle_path(@bicycle), "post" do

      assert_select "input#bicycle_name[name=?]", "bicycle[name]"

      assert_select "input#bicycle_description[name=?]", "bicycle[description]"
    end
  end
end
