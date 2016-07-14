class User
  def model_method
    "called model method"
  end
end

Post = Class.new

class UserPresenter < PresenterObject::Base
  presents :user

  def presenter_method
    "called presenter method"
  end
end

class PostPresenter < PresenterObject::Base
  presents :post
end