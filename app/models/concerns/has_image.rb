module HasImage
  extend ActiveSupport::Concern

  included do
    has_one_attached :image
    validate :acceptable_image?
  end

  def displayed_image
    if image.attached?
      image
    else
      "profile-default.png"
    end
  end

  private

  def acceptable_image?
    return unless image.attached?
    acceptable_image_size?
    acceptable_image_type?
  end

  def acceptable_image_size?
    return unless image.byte_size > 1.megabyte
    errors.add :image, "is over 1MB"
  end

  def acceptable_image_type?
    return if image.content_type.in? ["image/png", "image/jpeg"]
    errors.add :image, "must be a PNG or JPG"
  end
end
