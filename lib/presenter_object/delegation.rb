module PresenterObject::Delegation
  def method_missing(name, *args, &block)
    if object.respond_to? name
      object.send name, *args, &block
    elsif view_context.respond_to? name
      view_context.send name, *args, &block
    else
      super
    end
  end

  def respond_to?(name, include_private = false)
    if object.respond_to?(name, include_private) || view_context.respond_to?(name, include_private)
      true
    else
      super
    end
  end
end