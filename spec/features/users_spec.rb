require 'rails_helper'

feature 'users' do
  context 'user clicks on username' do

    scenario 'goes to profile page and has a thumbnail' do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      photo = FactoryGirl.create(:photo, user: user)

      visit '/photos'
      click_link "#{user.email}"

      expect(current_path).to eq "/users/#{user.id}"
      expect(page).to have_css("img[@src*='thumb/smokingduck.jpg']")
    end

  end
end
