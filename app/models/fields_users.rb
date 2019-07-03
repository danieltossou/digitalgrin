class FieldUser < ApplicationRecord
    has_one :user,
    has_one :field
end
