class Field < ApplicationRecord
    has_many :messages
    has_many :posts
end
