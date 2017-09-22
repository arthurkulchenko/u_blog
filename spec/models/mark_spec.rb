require 'rails_helper'

RSpec.describe Mark, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
end
