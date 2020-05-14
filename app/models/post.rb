class Post < ApplicationRecord
  validates :title, presence: true, #require a title,
                    length: {minimum: 5}
  validates :body, presence: true, #require a body,
                    length: {minimum: 5}
  validates :categories, presence: true, #require categories,
                    length: {minimum: 3}
                    
end
