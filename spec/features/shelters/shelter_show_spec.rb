require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  it "can show the attributes of the shelter with that id" do
  shelter_1 = Shelter.create(
    name: "Paws For You",
    address: "1234 W Elf Ave",
    city: "Denver",
    state: "Colorado",
    zip: "90210")

  shelter_2 = Shelter.create(
    name: "Forever Pet",
    address: "1234 S Ahgase Blvd",
    city: "Boulder",
    state: "Colorado",
    zip: "90210")

  visit "/shelters/#{shelter.id}"
  expect(page).to have_content(shelter_1.name)
  end
end
