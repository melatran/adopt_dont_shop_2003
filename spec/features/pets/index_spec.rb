require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see all pets" do
    pet_1 = Pet.create(
      image: 'https://www.petful.com/wp-content/uploads/2014/01/maltese-1.jpg',
      name: "MoMo",
      approximate_age: "4",
      sex: "male",
      name_of_shelter_where_pet_is_currently_located: "Life is Ruff"
    )

    visit '/pets'
    expect(page).to have_css("img[src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.name_of_shelter_where_pet_is_currently_located)
  end
end
