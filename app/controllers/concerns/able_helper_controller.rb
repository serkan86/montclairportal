module AbleHelperController
  extend ActiveSupport::Concern

  included do

  end

  module ClassMethods

  end

  private

  def able
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.respond_to?(:friendly, true) ? $1.classify.constantize.friendly.find(value) : $1.classify.constantize.find(value)
      end
    end
    nil
  end
end