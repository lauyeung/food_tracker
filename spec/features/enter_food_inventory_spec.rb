require 'spec_helper'

feature 'user enters food inventory', %Q{
  As a food service employee
  I want to receive inventory
  So that it can be recorded that we have food items
  } do

# Acceptance Criteria:
# * I must specify a title, description, and quantity of the food item
# * If I do not specify the required information, I am prompted to fix errors and to resubmit
# * If I specify the required information, my inventory entry is recorded.

  scenario 'user does not specify valid information' do
    visit new_food_inventory_item_path
    click_on 'Create Food inventory item'
    expect(page).to have_content "can't be blank"
  end

  scenario 'user specifies valid information' do
    title = "Cookies"
    description = "Perfectly chewy"
    quantity = 100

    visit new_food_inventory_item_path
    click_on 'Create Food inventory item'
    fill_in 'Title', with: title
    fill_in 'Description', with: description
    fill_in 'Quantity', with: quantity
    click_on 'Create Food inventory item'
    expect(page).to have_content title
    expect(page).to have_content description
    expect(page).to have_content quantity.to_s
  end

end
