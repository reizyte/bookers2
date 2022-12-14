class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :profile_image
   has_many :books, dependent: :destroy
   has_many :relationships, foreign_key: :followed_id, dependent: :destroy
   has_many :followeds, through: :relationships, source: :follower
   has_many :reverce_of_relationshiips, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
   has_many :followers, through: :reverce_of_relationshiips, source: :followed

   validates :name, uniqueness: true
   validates :name, length: {in: 2..20}
   validates :introduction, length: {maximum:50}



    def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
    end

    def is_followed_by(user)
      reverce_of_relationshiips.find_by(followed_id: user.id).present?
    end

end
