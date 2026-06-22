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

        VERSIONS = [

          :V18,

          :V19,

          :V20

        ]

        HIGHEST_VERSION = :V20

        def self.version_alternate_for(type)
          unless [:resources, :services, :enums, :operations].include?(type)
            raise ArgumentError.new(
              "Dont have version alternate for #{type}, valid values are :resources, :services, :enums, :operations,  got #{type}"
            )
          end

          VersionAlternate.new(
            FACTORY_V20.public_send(type),
            {

              V18: FACTORY_V18.public_send(type),

              V19: FACTORY_V19.public_send(type),

              V20: FACTORY_V20.public_send(type)

            }
          )
        end

        def self.versions
        end

        def self.at_version(version)
          case version

          when :V18
            FACTORY_V18

          when :V19
            FACTORY_V19

          when :V20
            FACTORY_V20

          else
            raise ArgumentError.new("Got unkown version: #{version}")
          end
        end
      end
    end
  end
end