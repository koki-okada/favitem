class Item < ApplicationRecord
    mount_uploader :img, ImgUploader
end
