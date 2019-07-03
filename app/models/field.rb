class Field < ApplicationRecord
    has_and_belongs_to_many :users

    has_many :messages
    has_many :posts
    scope :actived, -> {where(etat: true)}
    scope :desactived, -> {where(etat: false)}
end
