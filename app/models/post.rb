class Post < ApplicationRecord
  belongs_to :user
  has_many :ip_lists
  has_many :marks
end
