module OppourtunitiesHelper

  def oppourtunity_thumbnail oppourtunity
    img = oppourtunity.photo.present? ? oppourtunity.photo.thumb.url : "placeholder.jpg"
    image_tag img, class: "oppourtunity-thumb"
  end

  def oppourtunity_thumbnail_url oppourtunity
    oppourtunity.photo.present? ? oppourtunity.photo.thumb.url : asset_url("placeholder.jpg")
   
  end

  def oppourtunity_photo_url oppourtunity
    oppourtunity.photo.present? ? oppourtunity.photo.url : asset_url("placeholder.jpg")

  end
end
