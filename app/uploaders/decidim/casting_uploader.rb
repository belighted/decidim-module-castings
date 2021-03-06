# frozen_string_literal: true

module Decidim
  class CastingUploader < ApplicationUploader
    include CarrierWave::MiniMagick

    process :set_content_type_and_size_in_model

    protected

    def extension_whitelist
      %w(csv)
    end

    # CarrierWave automatically calls this method and validates the content
    # type fo the temp file to match against any of these options.
    def content_type_whitelist
      [
        "text/csv",
        "text/x-csv",
        "text/comma-separated-values",
        "text/x-comma-separated-values",
        "application/vnd.ms-excel",
        "application/csv",
        "application/x-csv",
      ]
    end

    # Copies the content type and file size to the model where this is mounted.
    #
    # Returns nothing.
    def set_content_type_and_size_in_model
      model.file_content_type = file.content_type if file.content_type
      model.file_size = file.size
    end

  end
end
