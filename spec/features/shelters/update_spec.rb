require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(
      name: "Paws For You",
      address: "1234 W Elf Ave",
      city: "Denver",
      state: "Colorado",
      zip: "90210")
  end

  it "can update a shelters information" do

    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_link("Update Shelter")
    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

    fill_in "shelter[name]", with: "MoMo's Adoption"
    fill_in "shelter[address]", with: "1234 S Ahgase Way"
    fill_in "shelter[city]", with: "Arcadia"
    fill_in "shelter[state]", with: "CA"
    fill_in "shelter[zip]", with: "91006"

    click_on "Submit"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content("MoMo's Adoption")
    expect(page).to have_content("1234 S Ahgase Way")
    expect(page).to have_content("Arcadia")
    expect(page).to have_content("CA")
    expect(page).to have_content("91006")
  end
end
