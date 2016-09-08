require "active_support/core_ext/string/inflections"
require "active_support/concern"
require "presenter_object/version"
require "presenter_object/delegation"
require "presenter_object/base"
require "presenter_object/presentable"
require "presenter_object/collection"

module PresenterObject
  SUFFIX = "Presenter"

  def self.load_presenter!(name)
    Object.const_get "#{name}#{SUFFIX}"
  rescue NameError
    nil
  end
end
