class Post < ApplicationRecord
  validates :title, presence: true, #require a title,
                    length: {minimum: 5}
end
