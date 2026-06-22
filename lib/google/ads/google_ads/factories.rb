require "google/ads/google_ads/version_alternate"

require "google/ads/google_ads/factories/v18/resources"
require "google/ads/google_ads/factories/v18/services"
require "google/ads/google_ads/factories/v18/enums"
require "google/ads/google_ads/factories/v18/operations"

require "google/ads/google_ads/factories/v19/resources"
require "google/ads/google_ads/factories/v19/services"
require "google/ads/google_ads/factories/v19/enums"
require "google/ads/google_ads/factories/v19/operations"

require "google/ads/google_ads/factories/v20/resources"
require "google/ads/google_ads/factories/v20/services"
require "google/ads/google_ads/factories/v20/enums"
require "google/ads/google_ads/factories/v20/operations"

require "google/ads/google_ads/factories/v21/resources"
require "google/ads/google_ads/factories/v21/services"
require "google/ads/google_ads/factories/v21/enums"
require "google/ads/google_ads/factories/v21/operations"

require "google/ads/google_ads/factories/v22/resources"
require "google/ads/google_ads/factories/v22/services"
require "google/ads/google_ads/factories/v22/enums"
require "google/ads/google_ads/factories/v22/operations"

require "google/ads/google_ads/factories/v23/resources"
require "google/ads/google_ads/factories/v23/services"
require "google/ads/google_ads/factories/v23/enums"
require "google/ads/google_ads/factories/v23/operations"

require "google/ads/google_ads/factories/v24/resources"
require "google/ads/google_ads/factories/v24/services"
require "google/ads/google_ads/factories/v24/enums"
require "google/ads/google_ads/factories/v24/operations"

module Google
  module Ads
    module GoogleAds
      module Factories
        Factory = Struct.new(:resources, :services, :enums, :operations)

        FACTORY_V18 = Factory.new(
          V18::Resources,
          V18::Services,
          V18::Enums,
          V18::Operations
        ).freeze

        FACTORY_V19 = Factory.new(
          V19::Resources,
          V19::Services,
          V19::Enums,
          V19::Operations
        ).freeze

        FACTORY_V20 = Factory.new(
          V20::Resources,
          V20::Services,
          V20::Enums,
          V20::Operations
        ).freeze

        FACTORY_V21 = Factory.new(
          V21::Resources,
          V21::Services,
          V21::Enums,
          V21::Operations
        ).freeze

        FACTORY_V22 = Factory.new(
          V22::Resources,
          V22::Services,
          V22::Enums,
          V22::Operations
        ).freeze

        FACTORY_V23 = Factory.new(
          V23::Resources,
          V23::Services,
          V23::Enums,
          V23::Operations
        ).freeze

        FACTORY_V24 = Factory.new(
          V24::Resources,
          V24::Services,
          V24::Enums,
          V24::Operations
        ).freeze

        VERSIONS = [
          :V18, :V19, :V20, :V21, :V22, :V23, :V24
        ]

        HIGHEST_VERSION = :V24

        def self.version_alternate_for(type)
          unless [:resources, :services, :enums, :operations].include?(type)
            raise ArgumentError.new(
              "Dont have version alternate for #{type}, valid values are :resources, :services, :enums, :operations,  got #{type}"
            )
          end

          VersionAlternate.new(
            FACTORY_V24.public_send(type),
            {
              V18: FACTORY_V18.public_send(type),
              V19: FACTORY_V19.public_send(type),
              V20: FACTORY_V20.public_send(type),
              V21: FACTORY_V21.public_send(type),
              V22: FACTORY_V22.public_send(type),
              V23: FACTORY_V23.public_send(type),
              V24: FACTORY_V24.public_send(type)
            }
          )
        end

        def self.versions
        end

        def self.at_version(version)
          case version
          when :V18 then FACTORY_V18
          when :V19 then FACTORY_V19
          when :V20 then FACTORY_V20
          when :V21 then FACTORY_V21
          when :V22 then FACTORY_V22
          when :V23 then FACTORY_V23
          when :V24 then FACTORY_V24
          else
            raise ArgumentError.new("Got unknown version: #{version}")
          end
        end
      end
    end
  end
end