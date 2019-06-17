class Field < ApplicationRecord
    has_many :messages
    has_many :posts
    scope :actived, -> {where(etat: true)}
    scope :desactived, -> {where(etat: false)}
end
