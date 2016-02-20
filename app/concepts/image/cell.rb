class Image::Cell < Cell::Concept

  extend Paperdragon::Model::Reader # book p185
  processable_reader :image
  property :image_meta_data

  def show
    version = options[:version] || :original
    version = version.to_sym
    image_tag image[version].url if image.metadata.has_key?(version)
  end

end
