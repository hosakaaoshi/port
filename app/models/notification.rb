class Notification < ApplicationRecord
  default_scope -> { order(create_at: :desc) }
  belongs_to :tweet, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  def self.save_notification_comment!(current_user, visited_id, tweet_id, comment_id)
    if current_user.id == visited_id
      return
    end
    notification = Notification.new(
      visitor_id: current_user.id,
      visited_id: visited_id,
      tweet_id: tweet_id,
      comment_id: comment_id,
      action: 'comment'
    )
    notification.save if notification.valid?
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
  def self.save_notification_favorite!(current_user, visited_id, tweet_id, favorite_id)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and tweet_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
     if notification.visitor_id == notification.visited_id
        notification.checked = true
     end
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: user_id,
        tweet_id: id,
        action: 'favorite'
      )
      notification.save if notification.valid?
    end
  end
end
