module DefaultPageContent
  extend ActiveSupport::Concern
  included do
  before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title ="My SassPortfolio Website"
    @seo_keywords = " Foliwe Fossung SassPortfolio"
  end
end