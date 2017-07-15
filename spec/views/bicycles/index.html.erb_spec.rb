require 'rails_helper'

RSpec.describe "bicycles/index", type: :view do
  before(:each) do
    assign(:bicycles, [
      Bicycle.create!(
        :name => "Name 1",
        :description => "Description",
        category: create(:category)
      ),
      Bicycle.create!(
        :name => "Name 2",
        :description => "Description",
        category: create(:category)
      )
    ])
  end

  it "renders a list of bicycles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
