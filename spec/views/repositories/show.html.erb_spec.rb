require 'rails_helper'

RSpec.describe "repositories/show", type: :view do
  before(:each) do
    @repository = assign(:repository, Repository.create!(
      :name => "Name",
      :description => "Description",
      :visibility => "Visibility",
      :status => "Status",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Visibility/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
  end
end
