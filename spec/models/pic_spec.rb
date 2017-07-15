require 'rails_helper'

RSpec.describe Pic, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:pic)).to be_valid
  end
end
