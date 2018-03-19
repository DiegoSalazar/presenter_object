class User
  attr_reader :id

  def model_method
    "called model method"
  end
end

class Post
  attr_reader :id
end

class UserPresenter < PresenterObject::Base
  presents :user

  def presenter_method
    "called presenter method"
  end
end

class TestPresenter < PresenterObject::Base
  # nothing needed
end

class PresentableUserPresenter < PresenterObject::Base
  presents :presentable_user

  def presenter_method
    "called presenter method"
  end
end

class PostPresenter < PresenterObject::Base
  presents :post
end

class PresentableUser
  attr_reader :id
  include PresenterObject::Presentable
end

class UserCollection < PresenterObject::Collection
  def collection_presenter_method
    "called collection presenter method"
  end
end
