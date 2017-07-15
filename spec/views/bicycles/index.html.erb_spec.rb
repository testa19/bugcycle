require 'rails_helper'

RSpec.describe "bicycles/index", type: :view do
  before(:each) do
    assign(:bicycles, [
      Bicycle.create!(
        :name => "Name",
        :description => "Description"
      ),
      Bicycle.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of bicycles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
