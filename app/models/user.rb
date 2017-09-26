class User < ApplicationRecord

  has_many :ip_lists
  has_many :posts

end