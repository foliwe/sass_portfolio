class Portfolio < ApplicationRecord
  has_many :technologies ,dependent: :destroy

  validates_presence_of :title, :body, :main_image, :thumb_image
  accepts_nested_attributes_for :technologies, 
                                allow_destroy: true,
                                reject_if: lambda {|attrs| attrs['name'].blank?}

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: 'Angular')
  end
  scope :rails, -> {where(subtitle: 'Ruby On Rails')}


  def self.by_position
    order("position ASC")
  end

end
  