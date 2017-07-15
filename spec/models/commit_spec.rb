require 'rails_helper'

RSpec.describe Commit, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:commit)).to be_valid
  end

  it "is valid with bicycle and user ids" do
    event = Commit.new(bicycle: build(:bicycle), user: build(:user))
    expect(event).to be_valid
  end

  context "validations" do
    context "uniqueness" do
      it { should validate_uniqueness_of(:user_id) }
      it { should validate_uniqueness_of(:bicycle_id) }
    end
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:bicycle) }
  end
end