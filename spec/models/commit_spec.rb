require 'rails_helper'

RSpec.describe Commit, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:commit)).to be_valid
  end
end
