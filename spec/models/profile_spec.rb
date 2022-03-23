require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#new' do
    it 'new Profile' do
      profile = create(:profile)

      expect(profile.user.nil?).to eq(false)
    end
  end
end
