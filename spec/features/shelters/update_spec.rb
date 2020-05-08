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

    fill_in :name, with: "MoMo's Adoption"

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to have_content("MoMo's Adoption")
  end
end
