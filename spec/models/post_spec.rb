require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_many(:marks) }
  it { should have_many(:ip_lists) }
end
