# Presenter superclass. Create your own presenter by sub-classing `PresenterObject::Base`
# and declaring the name of the model it will present. 
#
# e.g:
#
#   class DocumentPresenter << PresenterObject::Base
#     presents :document
#
#    .. add instance methods here ..
#   end
#
# Create a presenter instance by giving it a model instance e.g:
#
#   document = DocumentPresenter.new Document.find(params[:id]) 
#   document.sender # can call any document model methods...
#   document.pretty_sender # ...as well as any presenter defined method
#   document.class # is the wrapped object's class, helps it behave like models do in forms, link helpers etc.
#
class PresenterObject::Base
  include PresenterObject::Delegation
  attr_reader :object, :class, :to_param, :view_context

  class << self
    def presents(class_name)
      @class_name = class_name.to_s.classify
      presenters[@class_name] = self
    end

    def presented_class
      @presented_class ||= @class_name.constantize
    end

    def presenters
      @@presenters ||= {}
    end
  end

  def initialize(object, view_context = nil)
    @object = object
    @class = object.class # impersonate object's class
    @to_param = object.id # let link helpers know the object's id
    @view_context = view_context
  end
end
