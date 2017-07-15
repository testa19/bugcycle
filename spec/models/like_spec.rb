require 'rails_helper'

RSpec.describe Like, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:like)).to be_valid
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:bicycle) }
  end
end
