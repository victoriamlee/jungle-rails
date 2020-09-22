require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "They see selected product" do
      visit root_path
      expect(page).to have_css 'article.product', count: 10
      save_screenshot 'test-2-home_page1.png'
  
      first('.product img').click
      sleep(1)
      save_screenshot 'test-2-home_page2.png'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Description'
      expect(page).to have_content 'Quantity'
    end
end
