require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    before do
      visit '/photos'
    end

    scenario 'should display a button to upload a new photo' do
      expect(page).to have_content 'Nobody has added any photos :('
      expect(page).to have_button 'Add New Photo'
    end

    scenario '\'Add New Photo\' button should take user to new photo page' do
      click_button 'Add New Photo'
      expect(current_path).to eq '/photos/new'
    end
  end

  context 'adding a new photo' do
    before do
      test_sign_up
    end

    scenario 'user should be able to add a new photo' do
      test_add_photo
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'Clifton Suspension Bridge :D'
      expect(page).to have_css("img[@src*='medium/smokingduck.jpg']")
    end
  end
end
