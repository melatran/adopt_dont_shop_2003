require 'rails_helper'

RSpec.describe "as a user, when i visit the shelters index", type: :feature do
  it "can see the names of each shelter" do
    shelter_1 = Shelter.create(name: "Paws For You")
    shelter_2 = Shelter.create(name: "Furry Pals")

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
