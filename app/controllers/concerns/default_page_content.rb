module DefaultPageContent
  extend ActiveSupport::Concern
  included do
  before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title ="My SassPortfolio Wesite"
    @seo_keywords = " Foliwe Fossung SassPortfolio"
  end
end