require 'rails_helper'

RSpec.describe Bicycle, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:bicycle)).to be_valid
  end
end
