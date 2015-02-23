require 'rails_helper'

RSpec.describe "the signin process", :type => :feature do
  before :each do
    user = User.make!(first_name: 'Bill', last_name: 'Leeper', email: "bill@example.com", password: "password", password_confirmation: "password")
  end
  
  shared_examples "valid user" do |path|
    it "signs me in" do
      reset_session!
      visit path
      within("#new_user") do
        fill_in 'Email', :with => 'bill@example.com'
        fill_in 'Password', :with => 'password'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      expect(current_path).to eq(dashboard_path)
    end
  end

  shared_examples "invalid user/password" do |path|
    it "redirects to login page" do
      reset_session!
      visit path
      within("#new_user") do
        fill_in 'Email', :with => 'bill@example.com'
        fill_in 'Password', :with => 'wrong'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid email or password'
      expect(current_path).to eq(new_user_session_path)
    end
  end

  context "on home page" do
    let(:path) {'/'}

    it_behaves_like "valid user" 
    it_behaves_like "invalid user/password" 
  end

  context "on login page" do
    let(:path) {'/users/sign_in'}

    it_behaves_like "valid user" 
    it_behaves_like "invalid user/password" 
  end

  it "should remember origial page after logging in" do
    reset_session!
    visit edit_user_registration_path # need a better path, but right now there is only one restricted page
    expect(current_path).to eq(new_user_session_path)
    within("#new_user") do
      fill_in 'Email', :with => 'bill@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq(edit_user_registration_path)
  end

end