class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: 'Angular')
  end
  scope :rails, -> {where(subtitle: 'Ruby On Rails')}

  after_initialize :set_defaults


  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '800', width:'400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '150')
  end
end
  