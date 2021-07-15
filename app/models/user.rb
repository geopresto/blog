class User < ApplicationRecord

    has_secure_password
    has_one_attached :avatar
    has_many_attached :photos
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy

    

end
