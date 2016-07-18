def test_sign_up(email: 'example@example.com', password: 'password', password_confirm: 'password')
  visit '/'
  click_link 'Register'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirm
  click_button 'Sign up'
end

def test_add_photo
  visit '/photos/new'
  @file = fixture_file_upload('smokingduck.jpg', 'image/jpeg')
  fill_in 'Description', with: 'Clifton Suspension Bridge :D'
  attach_file "Image", "#{Rails.root}/spec/fixtures/smokingduck.jpg"
  click_button 'Add'
end
