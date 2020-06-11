module OppourtunitiesHelper

  def oppourtunity_thumbnail oppourtunity
    img = oppourtunity.photo.present? ? oppourtunity.photo.thumbnail.url : "placeholder.png"
    image_tag img, class: "img-thumbnail"
  end

  def oppourtunity_photo_url oppourtunity
    oppourtunity.photo.present? ? oppourtunity.photo.url : asset_url("placeholder.png")

  end
end
