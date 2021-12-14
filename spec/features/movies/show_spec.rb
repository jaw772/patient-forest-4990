require 'rails_helper'

RSpec.describe 'the show page' do
  describe 'When a user visits the movies show page' do
    let!(:universal){Studio.create!(name: 'Universal Studios', location: 'Hollywood')}
    let!(:raider){universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')}
    let!(:shrek){universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')}
    let!(:bob){raider.actors.create!(name: 'Bob', age: 27)}
    let!(:frank){raider.actors.create!(name: 'Frank', age: 54)}
    let!(:donkey){shrek.actors.create!(name: 'Donkey', age: 6)}
    it "they see each movie's title, creation_year, and genre and a list of all actors ordered by age, youngest first" do
      visit "/movies/#{raider.id}"

      expect(page).to have_content(raider.title)
      expect(page).to have_content(raider.creation_year)
      expect(page).to have_content(raider.genre)

      # save_and_open_page
      expect(bob.name).to appear_before(frank.name)
      expect(page).to_not have_content(donkey.name)
    end
    it "shows average age of actors" do
      visit "/movies/#{raider.id}"

      expect(page).to have_content(40.5)
    end
  end
end
