require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can see a product" do
    visit root_path
    expect(page).to have_css 'article.product', count: 1
  end

  scenario "User can se the 'Details' link" do
    visit root_path
    expect(page).to have_link("Details", visible: true)
  end

  scenario "User can click on the 'Details' link and this then shows the product" do
    visit root_path
    click_on 'Details'
    expect(page).to have_css '.product-detail', count: 1
    end

end