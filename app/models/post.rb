class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :snaps

  validates :name, presence: true
  validates :description, presence: true

  def average_rating
    ratings = []
    comments = Comment.where("post_id = ?", id)
    comments.each do |comment|
      ratings << comment.rating
    end

    total = 0
    if ratings == []
      return 0
    end

    ratings.each do |rating|
      total += rating.to_f
    end

    (total/ratings.length).round(1)
  end
end
