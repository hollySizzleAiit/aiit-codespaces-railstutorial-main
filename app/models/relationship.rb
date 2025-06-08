class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User',
                        counter_cache: :following_count
  belongs_to :followed, class_name: 'User',
                        counter_cache: :followers_count
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validate :not_following_self

  private

  def not_following_self
    return unless follower_id == followed_id

    errors.add(:base, 'You cannot follow yourself')
  end
end
