# Presenter superclass for collections. Create your own collection presenter by sub-classing `PresenterObject::Collection`.
#
# e.g:
#
#   class DocumentCollectionPresenter << PresenterObject::Collection
#    .. add methods here ..
#   end
#
# Create a presenter instance by giving it a model instance e.g:
#
#   documents = DocumentCollectionPresenter.new Document.where(publish: true) 
#   documents.method_that_presents_collection
#
class PresenterObject::Collection
  include Enumerable
  include PresenterObject::Delegation
  attr_reader :collection, :view_context
  alias_method :object, :collection

  def initialize(collection, view_context = nil)
    @collection = collection
    @view_context = view_context
  end

  def each
    @collection.each { |object| yield object.presenterize view_context }
  end
end
