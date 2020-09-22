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
  
      fill_in ':email', with: 'hello@email.com'
      # execute_script 'hello@email.com'
      # first('.btn-primary').click
      # sleep(1)
      save_screenshot 'test-4-login_page2.png'
      # expect(page).to_not have_content 'My Cart (0)'
      # expect(page).to have_content 'My Cart (1)'
    end
end
