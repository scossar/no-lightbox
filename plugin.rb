# name: no-lightbox
# about: temporary fix that allows 'create thumbnails' to be toggled off
# version 0.1

after_initialize do

  CookedPostProcessor.class_eval do

    def post_process_images
      images = extract_images
      return if images.blank?

      images.each do |img|
        limit_size!(img)
        convert_to_link!(img) if SiteSetting.create_thumbnails?
      end

      update_topic_image
    end
  end

end