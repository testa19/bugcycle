require 'rails_helper'

RSpec.describe Pic, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:pic)).to be_valid
  end

  context "associations" do
    it { should belong_to(:bicycle) }
  end
end
