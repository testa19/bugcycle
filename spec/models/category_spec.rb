require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:category)).to be_valid
  end

  it "is valid with a name" do
    event = Category.new(name: "Bikes")
    expect(event).to be_valid
  end

  context "validations" do
    context "presence" do
      it { should validate_presence_of(:name) }
    end
    
    context "uniqueness" do
      it { should validate_uniqueness_of(:name) }
    end
  end
end
