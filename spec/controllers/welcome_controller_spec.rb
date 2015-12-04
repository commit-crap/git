require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  before do
    user = double('user')
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
