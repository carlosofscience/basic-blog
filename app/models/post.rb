class Post < ApplicationRecord

  has_many :comments #adding relationship so that a post can have many comments

  validates :title, presence: true, #require a title,
                    length: {minimum: 5}
  validates :body, presence: true, #require a body,
                    length: {minimum: 5}
  validates :categories, presence: true, #require categories,
                    length: {minimum: 3}
                    
end
