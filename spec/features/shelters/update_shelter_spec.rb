require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  it "can update a shelters information" do
    shelter_1 = Shelter.create(
      name: "Paws For You",
      address: "1234 W Elf Ave",
      city: "Denver",
      state: "Colorado",
      zip: "90210")

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link("Update Shelter")
    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/:id/edit")

    fill_in "Name", with: "Momo's Adoption"
    fill_in "Address", with: "1234 S Ahgase Blvd"
    fill_in "City", with: "Arcadia"
    fill_in "State", with: "California"
    fill_in "Zip", with: "90210"

    click_on "Submit"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("MoMo's Adoption")
    expect(page).to have_content("1234 S Ahgase Blvd")
    expect(page).to have_content("Arcadia")
    expect(page).to have_content("California")
    expect(page).to have_content("90210")
  end
end
