class Post < ApplicationRecord
    belongs_to :user
    belongs_to :field
    has_many :comments
end
