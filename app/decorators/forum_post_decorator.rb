class ForumPostDecorator < Draper::Decorator
  delegate_all

  def to_hash
    {
        id: id.to_s,
        author: author,
        display_name: User.display_name_from_username(author),
        text: text,
        timestamp: timestamp,
        likes: likes,
        likes_counts: likes.length,
        photos: decorate_photos,
        hash_tags: hash_tags,
        mentions: mentions
    }
  end

  def decorate_photos
    return [] unless photos
    photos.map { |x| { id: x, animated: !x.blank? && PhotoMetadata.find(x).animated } }
  end

end