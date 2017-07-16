FactoryGirl.define do
  factory :pic do
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/app/assets/images/squarebike.jpg')))
    name "MyString"
    bicycle
  end
end
