class Message < ApplicationRecord
    belongs_to :user
    belongs_to :field
    has_many :responses
end
