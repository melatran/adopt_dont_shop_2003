require 'rails_helper'

RSpec.describe "Pet Show Page" do
  before :each do
    @shelter_1 = Shelter.create(
      name: "Paws For You",
      address: "1234 W Elf Ave",
      city: "Denver",
      state: "Colorado",
      zip: "90210",
    )
    @pet_1 = Pet.create(
      image: 'https://www.petful.com/wp-content/uploads/2014/01/maltese-1.jpg',
      name: "MoMo",
      description: "spoiled",
      approximate_age: "4",
      sex: "male",
      name_of_shelter_where_pet_is_currently_located: "Paws For You",
      shelter_id: @shelter_1.id,
      status: "Adoptable"
    )
  end
  
  describe "when I see a link to update pets" do
    it "I can update pet" do

      visit "/pets/#{@pet_1.id}"
      click_link "Update Pet"
      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

      fill_in :image, with: "https://www.petful.com/wp-content/uploads/2014/01/maltese-1.jpg"
      fill_in :name, with: "MoMo"
      fill_in :description, with: "loves to nap"
      fill_in :approximate_age, with: "4"
      fill_in :sex, with: "male"

      click_on "Update Pet"
      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_content("loves to nap")
    end
  end
end
