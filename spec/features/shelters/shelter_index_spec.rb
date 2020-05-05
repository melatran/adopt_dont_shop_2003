require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  it "can see the names of each shelter" do
    shelter_1 = Shelter.create(name: "Paws For You")
    shelter_2 = Shelter.create(name: "Furry Pals")

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "can see the attributes of the shelter with that id"
  shelter_1 = Shelter.create(
    name: "Paws For You"
    address: "1234 W Elf Ave"
    city: "Denver"
    state: "Colorado"
    zip: "90210")
  shelter_2 = Shelter.create(name: "Furry Pals")

end
