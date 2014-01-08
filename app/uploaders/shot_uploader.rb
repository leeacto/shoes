# encoding: utf-8

class ShotUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
	#include Sprockets::Helpers::RailsHelper
	#include Sprockets::Helpers::IsolatedHelper

	include CarrierWave::MimeTypes
	process :set_content_type
	
  # Choose what kind of storage to use for this uploader:
   storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
		#'http://shoebinder.s3-website-us-west-2.amazonaws.com'
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

	version :main do
	  process :matte
    process :resize_to_fit => [300, 300]
	end

  version :thumb do
    process :resize_to_fit => [100, 100]
  end
	
	def matte
		manipulate! do |img|
		  w = img[:width]
			h = img[:height]
			pad = ((w-h).to_f.abs/2).to_i
			if w > h
				img = img.frame "0x#{pad}"
			elsif h > w
				img = img.frame "#{pad}x0"
			end
		end
	end

  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end
end
