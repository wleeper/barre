require 'rails_helper'

RSpec.describe StaticController, type: :controller do
	describe "GET #home" do
	  it "responds successfully with an HTTP 200 status code" do
	    get :home
	    expect(response).to be_success
	    expect(response).to have_http_status(200)
	  end

	  it "renders the index template" do
	    get :home
	    expect(response).to render_template("home")
	  end

	end

	describe "GET #dashboard" do
		it "should redirect to login page" do
			get :dashboard
			expect(response).to be_redirect
			expect(response).to redirect_to new_user_session_path
		end

		describe "with logged in user" do
			include_context "with valid user"
			it "should render dashboard" do
				get :dashboard
				expect(response).to be_success
				expect(response).to render_template('dashboard')
			end
		end
	end
end
