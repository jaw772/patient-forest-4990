require 'rails_helper'

RSpec.describe 'the index page' do
  describe 'When a user visits the studio index page' do
    let!(:universal){Studio.create!(name: 'Universal Studios', location: 'Hollywood')
}
    it "they see each studios name and location" do
      visit '/studios'

      expect(page).to have_content(universal.name)
      expect(page).to have_content(universal.location)
    end

    xit "underneath each studio there is all of its movies" do

      expect(universal.location).to appear_after()
    end
  end
end 
