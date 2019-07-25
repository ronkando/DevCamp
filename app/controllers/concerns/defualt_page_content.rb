module DefualtPageContent
  extend ActiveSupport::Concern

  included  do
    before_action :set_page_defualt

    def set_page_defualt
      @page_title = "DevCamp | Portfolios Page"
      @seo_keywords = "Ron Mizrachi portfolio"
    end
  end
end