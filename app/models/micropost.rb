class Micropost < ApplicationRecord
  # 演習 2.3.3 (2) の回答
  belongs_to :user
  validates :content, length: { maximum: 140 },
                      presence: true
end
