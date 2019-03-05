class Job < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
    has_many :likes, dependent: :destroy
    
    def self.search(search)
        if search
            where(['title LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%"])
        else
            all
        end
    end
end
