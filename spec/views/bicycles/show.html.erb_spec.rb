require 'rails_helper'

RSpec.describe "bicycles/show", type: :view do
  before(:each) do
    @bicycle = assign(:bicycle, Bicycle.create!(
      :name => "Name",
      :description => "Description",
      category: create(:category)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
