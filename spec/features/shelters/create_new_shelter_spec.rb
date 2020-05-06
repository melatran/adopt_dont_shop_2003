require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  it "can create a shelter clicking on new shelter" do
    visit "/shelters"
    expect(page).to have_link("New Shelter")
    click_link "New Shelter"
    expect(current_path).to eq("/shelters/new")

    name = "Life is Ruff"
    address = "9246 N Santa Lane"
    city = "Aurora"
    state = "CO"
    zip = "38431"

    fill_in "Name", with: name
    fill_in "Address", with: address
    fill_in "City", with: city
    fill_in "State", with: state
    fill_in "Zip", with: zip

    click_button "Submit"

    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Life is Ruff")
  end
end
