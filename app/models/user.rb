class User < ApplicationRecord
  # 演習 2.3.3 (3) の回答
  has_many :microposts
  validates :name, presence: true    # nameが存在することを検証
  validates :email, presence: true   # emailが存在することを検証
end
