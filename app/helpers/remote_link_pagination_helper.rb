module RemoteLinkPaginationHelper
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    include BootstrapPagination::BootstrapRenderer
    def link(text, target, attributes = {})
      attributes['data-remote'] = true
      super
    end
  end
end