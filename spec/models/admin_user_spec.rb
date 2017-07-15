require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:admin_user)).to be_valid
    end
  end

  context "validations" do
    before { create(:admin_user) }

    context "presence" do
      it "is valid with a email and password" do
        event = build(:admin_user)
        expect(event).to be_valid
      end
    end
    
    context "uniqueness" do
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end
  end
end
