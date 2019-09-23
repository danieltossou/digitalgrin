class Image < ApplicationRecord

    mount_uploader :image, ImageUploader

    # adds an `image` virtual attribute
end
