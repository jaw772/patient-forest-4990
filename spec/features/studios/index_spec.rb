require 'rails_helper'

RSpec.describe 'the index page' do
  describe 'When a user visits the studio index page' do
    let!(:universal){Studio.create!(name: 'Universal Studios', location: 'Hollywood')}
    let!(:raider){universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')}
    let!(:shrek){universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')}
    it "they see each studios name and location" do
      visit '/studios'

      expect(page).to have_content(universal.name)
      expect(page).to have_content(universal.location)
    end

    it "underneath each studio there is all of its movies" do
      visit '/studios'
      save_and_open_page
      expect(universal.name).to appear_before(raider.title)
    end
  end
end
