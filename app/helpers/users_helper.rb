module UsersHelper
  def show_user_image(user)
    if user.image.attached?
      image_tag user.image.variant(resize: "50x50"), class: "profile-image"
    else
      image_tag "no_image.png", class: "profile-image"
    end
  end
end
