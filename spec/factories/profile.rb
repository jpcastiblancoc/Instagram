FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    user_name { Faker::Name.name+"_user" }
    date_birth {Date.new}

    after :build do |profile|
      profile.user = build(:user)
    end

  end
end
