class Portfolio < ApplicationRecord
  has_many :technologies ,dependent: :destroy
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda {|attrs| attrs['name'].blank?}

  def self.angular
    where(subtitle: 'Angular')
  end
  scope :rails, -> {where(subtitle: 'Ruby On Rails')}

  after_initialize :set_defaults

  def self.by_position
    order("position ASC")
  end

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width:'400')
    self.thumb_image ||= Placeholder.image_generator(height: '356', width: '280')
  end
end
  