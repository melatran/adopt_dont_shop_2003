require 'rails_helper'

RSpec.describe "as a user, when i visit the index page", type: :feature do
  it "can show the pets" do
    pet_1 = Pet.create(
      image: 'https://www.petful.com/wp-content/uploads/2014/01/maltese-1.jpg',
      name: "MoMo",
      description: "Momo is a lovable boy that loves hugs, food, and naptime",
      approximate_age: "4",
      sex: "male",
      name_of_shelter_where_pet_is_currently_located: "Life is Ruff",
      status: "adopted"
    )

    visit "/pets/#{pet_1.id}"
    expect(page).to have_css("img[src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.status)
  end
end
