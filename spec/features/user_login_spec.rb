require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
    # SETUP
    before :each do
      @user = User.create!(
        first_name: "Victoria",
        last_name: "Lee",
        email: "hello@email.com",
        password: "123",
        password_confirmation: "123"
      )
    end
  
    scenario "They login" do
      visit login_path
      expect(page).to have_content 'Email:'
      expect(page).to have_content 'Password:'
      save_screenshot 'test-4-login_page1.png'
  
      fill_in 'email', with: 'hello@email.com'
      fill_in 'password', with: '123'
      sleep(1)
      save_screenshot 'test-4-login_page2.png'
      click_button "Login"
      sleep(1)
      save_screenshot 'test-4-login_page3.png'
      expect(page).to have_content 'Signed in as Victoria!'
      expect(page).to have_content 'Logout'
    end
end
