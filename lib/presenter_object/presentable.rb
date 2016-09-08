# Include this concern in a model class to easily wrap the model in a presenter e.g:
# 
# class Document < ActiveRecord::Base
#   include PresenterObject::Presentable
# end
# 
# Now turn any instance into a presenter-wrapped model e.g:
# 
# document = Document.find(params[:id]).presenterize
#
module PresenterObject::Presentable
  extend ActiveSupport::Concern

  PresenterNotRegistered = Class.new KeyError

  module ClassMethods
    def presenter_class
      PresenterObject::Base.presenters.fetch name.demodulize
    rescue KeyError
      raise PresenterNotRegistered, "No presenter registered for #{name}. Is it defined and loaded?"
    end
  end

  def presenter_class
    self.class.presenter_class
  end

  def presenterize(view_context = nil)
    presenter_class.new self, view_context
  end
end