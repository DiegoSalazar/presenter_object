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

class PostPresenter < PresenterObject::Base
  presents :post
end