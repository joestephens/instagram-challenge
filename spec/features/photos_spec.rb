require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a button to upload a new photo' do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      
      visit '/'
      expect(page).to have_content 'Nobody has added any photos :('
      expect(page).to have_button 'Add New Photo'
    end

    scenario '\'Add New Photo\' button should take user to new photo page' do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)

      visit '/'
      click_button 'Add New Photo'
      expect(current_path).to eq '/photos/new'
    end
  end

  context 'not signed in' do
    scenario 'shouldn\'t display a button to upload a new photo' do
      visit '/photos'
      expect(page).not_to have_button 'Add New Photo'
    end
  end

  context 'adding a new photo' do
    scenario 'user should be able to add a new photo' do
      user = FactoryGirl.create(:user)
      photo = FactoryGirl.create(:photo, user: user)
      login_as(user, scope: :user)

      visit '/'
      expect(page).to have_content 'Smoking Duck'
      expect(page).to have_css("img[@src*='medium/smokingduck.jpg']")
    end
  end
end
