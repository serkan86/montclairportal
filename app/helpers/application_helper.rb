module ApplicationHelper
  def paginate(collection, params= {})
    will_paginate collection, params.merge(renderer: RemoteLinkPaginationHelper::LinkRenderer, bootstrap: 3)
  end
end
