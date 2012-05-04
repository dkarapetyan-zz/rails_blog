require 'spec_helper'

describe "Pages" do


  describe "signup page" do
    before { get signup_path }

    it { response.should have_selector('h1',    content: 'Sign up') }
    it { response.should have_selector('title', content: 'Sign up') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) } 
    before { get user_path(user) }

    it { response.should have_selector('h1',    content: user.name) }
    #it { response.should have_selector('title', content: user.name) }
  end

  describe "signup" do

    before { get signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
