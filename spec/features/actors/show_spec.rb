require 'rails_helper'

RSpec.describe 'the show page' do
  describe 'When a user visits the actors show page' do
    let!(:universal){Studio.create!(name: 'Universal Studios', location: 'Hollywood')}
    let!(:raider){universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')}
    let!(:shrek){universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')}
    let!(:donkey){shrek.actors.create!(name: 'Donkey', age: 6)}
    let!(:fiona){shrek.actors.create!(name: 'Fiona', age: 24)}
    it "they see the actor's name and age as well as all actors they have worked with" do
      visit "actors/#{donkey.id}"

      expect(page).to have_content("Donkey")
      expect(page).to have_content(6)

      within("#related_actors") do
        expect(page).to have_content("Fiona")
      end
    end
  end
end
