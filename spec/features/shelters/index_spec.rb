require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(
      name: "Paws For You",
      address: "1234 W Elf Ave",
      city: "Denver",
      state: "Colorado",
      zip: "90210")

    @shelter_2 = Shelter.create(
      name: "Forever Pet",
      address: "1234 S Ahgase Blvd",
      city: "Boulder",
      state: "Colorado",
      zip: "90210")
    end

  it "can see the names of each shelter" do

    visit "/shelters"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end

  it "I can see an edit link next to the shelter" do
    visit "/shelters"
    
    expect(page).to have_link("Edit Shelter")
  end
end
