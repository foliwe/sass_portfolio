class Blog < ApplicationRecord
  belongs_to :topic
  has_many :comments ,dependent: :destroy
  enum post_status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title , :body

  def self.latest
    order("created_at DESC")
  end
end
