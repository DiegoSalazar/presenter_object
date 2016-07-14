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

  attr_reader :object, :class

  def initialize(object)
    @object, @class = object, object.class
  end

  def method_missing(name, *args, &block)
    super unless object.respond_to? name
    object.send name, *args, &block
  end

  def respond_to?(name, include_private = false)
    object.respond_to? name, include_private or super
  end
end