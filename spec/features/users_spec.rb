require 'rails_helper'

feature 'users' do
  context 'user clicks on username' do
    before do
      test_sign_up
      test_add_photo
      visit '/photos'
      click_link 'example@example.com'
    end

    scenario 'goes to profile page' do
      expect(current_path).to eq "/users/#{User.first.id}"
    end

    scenario 'has a thumbnail' do
      expect(page).to have_css("img[@src*='thumb/smokingduck.jpg']")
    end
  end
end
