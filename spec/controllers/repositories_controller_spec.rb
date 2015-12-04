require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  before do
    user = double('user')
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
  end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET #index" do
    it "assigns all repositories as @repositories" do
      repository = Repository.create! valid_attributes
      get :index, {}
      expect(assigns(:repositories)).to eq([repository])
    end
  end

  describe "GET #show" do
    it "assigns the requested repository as @repository" do
      repository = Repository.create! valid_attributes
      get :show, {:id => repository.to_param}
      expect(assigns(:repository)).to eq(repository)
    end
  end

  describe "GET #new" do
    it "assigns a new repository as @repository" do
      get :new, {}
      expect(assigns(:repository)).to be_a_new(Repository)
    end
  end

  describe "GET #edit" do
    it "assigns the requested repository as @repository" do
      repository = Repository.create! valid_attributes
      get :edit, {:id => repository.to_param}
      expect(assigns(:repository)).to eq(repository)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Repository" do
        expect {
          post :create, {:repository => valid_attributes}
        }.to change(Repository, :count).by(1)
      end

      it "assigns a newly created repository as @repository" do
        post :create, {:repository => valid_attributes}
        expect(assigns(:repository)).to be_a(Repository)
        expect(assigns(:repository)).to be_persisted
      end

      it "redirects to the created repository" do
        post :create, {:repository => valid_attributes}
        expect(response).to redirect_to(Repository.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved repository as @repository" do
        post :create, {:repository => invalid_attributes}
        expect(assigns(:repository)).to be_a_new(Repository)
      end

      it "re-renders the 'new' template" do
        post :create, {:repository => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested repository" do
        repository = Repository.create! valid_attributes
        put :update, {:id => repository.to_param, :repository => new_attributes}
        repository.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested repository as @repository" do
        repository = Repository.create! valid_attributes
        put :update, {:id => repository.to_param, :repository => valid_attributes}
        expect(assigns(:repository)).to eq(repository)
      end

      it "redirects to the repository" do
        repository = Repository.create! valid_attributes
        put :update, {:id => repository.to_param, :repository => valid_attributes}
        expect(response).to redirect_to(repository)
      end
    end

    context "with invalid params" do
      it "assigns the repository as @repository" do
        repository = Repository.create! valid_attributes
        put :update, {:id => repository.to_param, :repository => invalid_attributes}
        expect(assigns(:repository)).to eq(repository)
      end

      it "re-renders the 'edit' template" do
        repository = Repository.create! valid_attributes
        put :update, {:id => repository.to_param, :repository => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested repository" do
      repository = Repository.create! valid_attributes
      expect {
        delete :destroy, {:id => repository.to_param}
      }.to change(Repository, :count).by(-1)
    end

    it "redirects to the repositories list" do
      repository = Repository.create! valid_attributes
      delete :destroy, {:id => repository.to_param}
      expect(response).to redirect_to(repositories_url)
    end
  end

end
