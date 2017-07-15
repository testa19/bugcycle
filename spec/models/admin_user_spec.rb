require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:admin_user)).to be_valid
    end
  end
end
