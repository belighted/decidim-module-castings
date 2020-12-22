# frozen_string_literal: true

module Decidim
  class CastingResultFileUploader < ApplicationUploader
    include CarrierWave::MiniMagick

    protected

    def extension_whitelist
      %w(csv)
    end

    # CarrierWave automatically calls this method and validates the content
    # type fo the temp file to match against any of these options.
    def content_type_whitelist
      [
        %r{text\/csv}
      ]
    end

  end
end
