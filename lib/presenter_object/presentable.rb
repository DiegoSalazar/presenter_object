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
  PresenterNotRegistered = Class.new KeyError
  extend ActiveSupport::Concern

  module ClassMethods
    def presenter_class
      PresenterObject::Base.presenters.fetch name
    rescue KeyError
      if (presenter = PresenterObject.load_presenter!(name))
        presenter
      else
        raise PresenterNotRegistered, "No presenter registered for #{name}. Is it defined and loaded?"
      end
    end
  end

  def presenter_class
    self.class.presenter_class
  end

  def presenterize(view_context = nil)
    presenter_class.new self, view_context
  end
end