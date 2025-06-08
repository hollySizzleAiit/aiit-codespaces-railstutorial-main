class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :check_rate_limit, only: [:create]

  def create
    @user = User.find_by(id: params[:followed_id])
    if @user.nil?
      respond_to do |format|
        format.html do
          flash[:danger] = "User not found"
          redirect_back_or root_url
        end
        format.turbo_stream { head :not_found }
      end
    elsif current_user == @user
      respond_to do |format|
        format.html do
          flash[:danger] = "You cannot follow yourself"
          redirect_back_or root_url
        end
        format.turbo_stream { head :unprocessable_entity }
      end
    else
      current_user.follow(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.turbo_stream
      rescue StandardError => e
        format.turbo_stream { head :unprocessable_entity }
      end
    end
  end

  def destroy
    relationship = current_user.active_relationships.find_by(id: params[:id])
    if relationship.nil?
      respond_to do |format|
        format.html do
          flash[:danger] = "Relationship not found"
          redirect_back_or root_url
        end
        format.turbo_stream { head :not_found }
      end
    else
      @user = relationship.followed
      current_user.unfollow(@user)
      respond_to do |format|
        format.html { redirect_to @user, status: :see_other }
        format.turbo_stream
      rescue StandardError => e
        format.turbo_stream { head :unprocessable_entity }
      end
    end
  end

  private

    def check_rate_limit
      key = "follows:#{current_user.id}"
      count = Rails.cache.read(key) || 0

      if count >= 100  # 1時間に100回までフォロー可能
        flash[:danger] = "Rate limit exceeded. Please try again later."
        redirect_to root_url
      else
        Rails.cache.write(key, count + 1, expires_in: 1.hour)
      end
    end
end
