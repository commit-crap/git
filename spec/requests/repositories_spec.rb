require 'rails_helper'
require 'shared_contexts'

RSpec.describe "Repositories", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let(:email) { 'test_user1@example.com' }
  let(:password) { 'password' }

  let!(:user) { create(:user, email: email, password: password) }

  describe "GET /repositories" do
    it "works! (now write some real specs)" do
      sign_in(user)
      get repositories_path
      expect(response).to have_http_status(200)
    end
  end
end
