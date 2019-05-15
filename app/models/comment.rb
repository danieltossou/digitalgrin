class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    targets: ->(comment, key) {
      ([comment.post.user] + comment.post.commented_users.to_a - [comment.user]).uniq
    },
    # Path to move when the notification is opened by the target user
    # This is an optional configuration since activity_notification uses polymorphic_path as default
    notifiable_path: :post_notifiable_path,
    # Set true to :tracked option to generate automatic tracked notifications.
    # It adds required callbacks to generate notifications for creation and update of the notifiable model.
    tracked: true
  def post_notifiable_path
    post_path(post)
  end
end
