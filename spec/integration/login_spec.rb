require 'rails_helper'

RSpec.describe "Login from home page", :type => :request do

  it "displays the user's name after successful login" do
    user = User.make(first_name: 'Bill', last_name: 'Leeper', email: "bill@example.com", password: "password", password_confirmation: "password")
    user.save
    get "/"
    assert_select "form#new_user" do
      assert_select "input[name=?]", "user[email]"
      assert_select "input[name=?]", "user[password]"
      assert_select "button[type=?]", "submit"
    end

    post "/users/sign_in", user: {email: "bill@example.com", password: "password"}
    expect(response).to redirect_to dashboard_path
  end
end