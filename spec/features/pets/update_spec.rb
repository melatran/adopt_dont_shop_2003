require 'rails_helper'

RSpec.describe "as a user, when i visit the pets index", type: :feature do
  it "can update a pets information" do
    pet_1 = Pet.create(
      image: 'https://www.petful.com/wp-content/uploads/2014/01/maltese-1.jpg',
      name: "MoMo",
      description: "Momo is a lovable boy that loves hugs, food, and naptime",
      approximate_age: "4",
      sex: "male",
      status: "adopted"
    )

    visit "/pets/#{pet_1.id}"
    expect(page).to have_link("Update Pet")
    click_link "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    fill_in "pet[description]", with: "MoMo has been adopted to a loving family. Please find another pet to give a forever home"

    click_on "Submit"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("MoMo")
    expect(page).to have_content("MoMo has been adopted to a loving family. Please find another pet to give a forever home")
    expect(page).to have_content("4")
    expect(page).to have_content("male")
    expect(page).to have_content("adopted")
  end
end
