require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:posts) }
  it { should have_many(:ip_lists) }
  subject { FactoryGirl.build(:user) }
  it { should validate_presence_of(:login) }
  it { should validate_uniqueness_of(:login) }
end
