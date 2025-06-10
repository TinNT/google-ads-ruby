require "google/ads/google_ads/version_alternate"

require "google/ads/google_ads/factories/v17/resources"
require "google/ads/google_ads/factories/v17/services"
require "google/ads/google_ads/factories/v17/enums"
require "google/ads/google_ads/factories/v17/operations"

require "google/ads/google_ads/factories/v18/resources"
require "google/ads/google_ads/factories/v18/services"
require "google/ads/google_ads/factories/v18/enums"
require "google/ads/google_ads/factories/v18/operations"

require "google/ads/google_ads/factories/v19/resources"
require "google/ads/google_ads/factories/v19/services"
require "google/ads/google_ads/factories/v19/enums"
require "google/ads/google_ads/factories/v19/operations"

module Google
  module Ads
    module GoogleAds
      module Factories
        Factory = Struct.new(:resources, :services, :enums, :operations)

        FACTORY_V17 = Factory.new(
          V17::Resources,
          V17::Services,
          V17::Enums,
          V17::Operations
        ).freeze

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

        VERSIONS = [

          :V17,

          :V18,

          :V19

        ]

        HIGHEST_VERSION = :V19

        def self.version_alternate_for(type)
          unless [:resources, :services, :enums, :operations].include?(type)
            raise ArgumentError.new(
              "Dont have version alternate for #{type}, valid values are :resources, :services, :enums, :operations,  got #{type}"
            )
          end

          VersionAlternate.new(
            FACTORY_V19.public_send(type),
            {

              V17: FACTORY_V17.public_send(type),

              V18: FACTORY_V18.public_send(type),

              V19: FACTORY_V19.public_send(type)

            }
          )
        end

        def self.versions
        end

        def self.at_version(version)
          case version

          when :V17
            FACTORY_V17

          when :V18
            FACTORY_V18

          when :V19
            FACTORY_V19

          else
            raise ArgumentError.new("Got unkown version: #{version}")
          end
        end
      end
    end
  end
end
