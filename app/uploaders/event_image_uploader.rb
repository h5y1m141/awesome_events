# encoding: utf-8

class EventImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file
  # storage :fog
  process convert: 'jpg'


  version :thumb do
    # # process :resize_to_fit => [400, 200]
    # process resize_and_pad: [ 216, 137 ]
    process :resize_to_limit => [600, 600]
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def geometry
    @geometry ||= get_geometry
  end

  def get_geometry
    if @file and File.exists?(@file.file)
      img = ::Magick::Image::read(@file.file).first
      geometry = { width: img.columns, height: img.rows }
    end
  end

end
