require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a button to upload a new photo' do
      visit '/photos'
      expect(page).to have_content 'Nobody has added any photos :('
      expect(page).to have_button 'Add New Photo'
    end
  end
end
