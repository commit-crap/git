require 'rails_helper'

RSpec.describe "repositories/edit", type: :view do
  before(:each) do
    @repository = assign(:repository, Repository.create!(
      :name => "MyString",
      :description => "MyString",
      :visibility => "MyString",
      :status => "MyString",
      :user => nil
    ))
  end

  it "renders the edit repository form" do
    render

    assert_select "form[action=?][method=?]", repository_path(@repository), "post" do

      assert_select "input#repository_name[name=?]", "repository[name]"

      assert_select "input#repository_description[name=?]", "repository[description]"

      assert_select "input#repository_visibility[name=?]", "repository[visibility]"

      assert_select "input#repository_status[name=?]", "repository[status]"

      assert_select "input#repository_user_id[name=?]", "repository[user_id]"
    end
  end
end
