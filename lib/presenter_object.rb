require "active_support/core_ext/string/inflections"
require "active_support/concern"
require "presenter_object/version"
require "presenter_object/delegation"
require "presenter_object/base"
require "presenter_object/presentable"
require "presenter_object/collection"

module PresenterObject
  DEFAULT_OBJECT = Object
  SUFFIX = "Presenter"

  # If your presenters are namespaced, add the namespace module to this array
  # in case you have loading problems in development. This helps me find the presenter.
  # e.g
  # in /lib/initializers/presenter_object.rb
  # PresenterObject.namespaces << MyAwesomeSpace
  #
  def self.namespaces
    @namespaces ||= [DEFAULT_OBJECT]
  end

  def self.load_presenter!(name)
    namespaces.each do |space|
      presenter_class = space.const_get "#{name}#{SUFFIX}" rescue nil
      return presenter_class if presenter_class
    end
    DEFAULT_OBJECT
  end
end
