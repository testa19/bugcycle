require 'rails_helper'

RSpec.describe "Bicycles", type: :request do
  describe "GET /bicycles" do
    it "works! (now write some real specs)" do
      get bicycles_path
      expect(response).to have_http_status(200)
    end
  end
end
