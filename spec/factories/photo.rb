FactoryGirl.define do
  factory :photo do
    user
    description 'Smoking Duck'
    image { fixture_file_upload("#{Rails.root}/spec/fixtures/smokingduck.jpg", 'image/jpeg') }
  end
end
