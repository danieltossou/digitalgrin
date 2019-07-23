class Post < ApplicationRecord
    belongs_to :user
    belongs_to :field
    has_many :comments, dependent: :destroy
    has_many :commented_users, through: :comments, source: :user

    acts_as_url :title, url_attribute: :slug
    def to_param
        slug
    end
end
