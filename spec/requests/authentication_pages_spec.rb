require 'spec_helper'

describe "Authentication" do
  describe "signin" do
    before { get signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { response.should have_selector('title', content: 'Sign in') }
      it { response.should have_selector('div.alert.alert-error', content: 'Invalid') }

      describe "with valid information" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        it { response.should have_selector('title', content: user.name) }
        it { response.should have_link('Profile', href: user_path(user)) }
        it { response.should have_link('Sign out', href: signout_path) }
        it { response.should_not have_link('Sign in', href: signin_path) }
      end
    end
  end
end
