class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :tweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :text, presence: true, length: { maximum: 200 }
  default_scope { order(created_at: :desc) }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Tweet.where(text: content)
    elsif method == 'forward'
      Tweet.where('text LIKE ?', content + '%')
    elsif method == 'backward'
      Tweet.where('text LIKE ?', '%' + content)
    else
      Tweet.where('text LIKE ?', '%' + content + '%')
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
