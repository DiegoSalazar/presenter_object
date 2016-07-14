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

  module ClassMethods
    def presenter_class
      PresenterObject::Base.presenters.fetch name
    end
  end

  def presenter_class
    self.class.presenter_class
  end

  def presenterize
    presenter_class.new self
  end
end