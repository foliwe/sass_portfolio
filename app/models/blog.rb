class Blog < ApplicationRecord
  enum post_status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
end
