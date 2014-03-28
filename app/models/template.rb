class Template < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  def to_fileupload(attachment_name, attachment_style)
    {
      files: [
        {
          id:   read_attribute(:id),
          name: read_attribute("#{attachment_name}_file_name"),
          type: read_attribute("#{attachment_name}_content_type"),
          size: read_attribute("#{attachment_name}_file_size"),
          url:  send(attachment_name).url(attachment_style)
        }
      ]
    }
  end
end
