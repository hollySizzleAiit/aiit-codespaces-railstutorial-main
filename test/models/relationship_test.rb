require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:michael).id,
                                     followed_id: users(:archer).id)
  end

  test 'should be valid' do
    assert @relationship.valid?
  end

  test 'should require a follower_id' do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test 'should require a followed_id' do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

  test 'should not allow self-following' do
    relationship = Relationship.new(follower_id: users(:michael).id,
                                    followed_id: users(:michael).id)
    assert_not relationship.valid?
    assert_includes relationship.errors.full_messages, 'You cannot follow yourself'
  end

  test 'should update counter cache on create' do
    assert_difference -> { users(:archer).reload.followers_count } => 1 do
      assert_difference -> { users(:michael).reload.following_count } => 1 do
        @relationship.save
      end
    end
  end

  test 'should update counter cache on destroy' do
    @relationship.save
    assert_difference -> { users(:archer).reload.followers_count } => -1 do
      assert_difference -> { users(:michael).reload.following_count } => -1 do
        @relationship.destroy
      end
    end
  end
end
