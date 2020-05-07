require 'rails_helper'

RSpec.describe "when i visit the shelter index", type: :feature do
  it "can see each pet that can be adopted from the shelter" do
    shelter_1 = Shelter.create(
      name: "Paws For You",
      address: "1234 W Elf Ave",
      city: "Denver",
      state: "Colorado",
      zip: "90210")

    pet_1 = Pet.create(
      image: 'https://www.petful.com/wp-content/uploads/2014/01/maltese-1.jpg',
      name: "MoMo",
      approximate_age: "4",
      sex: "male",
      name_of_shelter_where_pet_is_currently_located: "Paws For You"
    )

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_css("img[src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
  end
end
