require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  it "can click on link New Shelter" do
    visit "/shelters"
    expect(page).to have_link("New Shelter")
    click_link "New Shelter"
    expect(current_path).to eq("/shelters/new")
  end

  it "can create a new shelter" do
    visit "/shelters/new"
    fill_in :name, with: "Life is Ruff"
    fill_in :address, with: "1234 S Ahgase Way"
    fill_in :city, with: "Arcadia"
    fill_in :state, with: "CA"
    fill_in :zip, with: "91006"

    click_on 'Create Shelter'
    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Life is Ruff")
  end
end
