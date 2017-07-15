require 'rails_helper'

RSpec.describe Bicycle, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:bicycle)).to be_valid
  end

  it { should have_one :pic }

  it "is valid with a name and category" do
    event = Bicycle.new(name: "Bike", category: build(:category))
    expect(event).to be_valid
  end

  context "validations" do
    context "presence" do
      before :each do
        @event = Bicycle.new(name: nil, description: nil, category: nil)
        @event.valid?
      end

      it "is invalid without a name " do 
        expect(@event.errors[:name]).to include(I18n.t('.errors.messages.blank'))
      end

      it "is invalid without a category" do 
        expect(@event.errors[:category]).to include("must exist")
      end
    end
    
    context "uniqueness" do
      it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
    end
  end

  context "associations" do
    it { should belong_to(:category) }
    it { should have_one(:user).through(:commit) }
    it { should have_many(:liked_by).through(:likes) }
  end 
end
