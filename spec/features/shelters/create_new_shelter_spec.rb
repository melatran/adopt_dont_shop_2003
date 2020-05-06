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

    fill_in :name, with: name
    fill_in :address, with: address
    fill_in :city, with: city
    fill_in :state, with: state
    fill_in :zip, with: zip

    click_on 'Submit'

    expect(current_path).to eq("/shelters")

    expect(page).to have_content("Life is Ruff")
  end
end
