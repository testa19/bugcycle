require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  context "validations" do
    before { create(:user) }

    context "presence" do
      it "is valid with a email and password" do
        event = build(:user)
        expect(event).to be_valid
      end
    end
    
    context "uniqueness" do
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end
  end

  context "associations" do
    it { should have_one(:bicycle).through(:commit) }
    it { should have_many(:liked).through(:likes) }
  end
end
