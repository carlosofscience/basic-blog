class Comment < ApplicationRecord
  belongs_to :post

  validates :username, presence: true, #require a body,
                    length: {minimum: 3}
  validates :body, presence: true, #require categories,
                    length: {minimum: 3}
  validates :post_id, presence: true #require id,

end
