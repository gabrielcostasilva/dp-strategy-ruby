# frozen_string_literal: true

require_relative "strategy/version"

module Strategy
  module IValidation
    def validate; end
  end

  class DriverLicenseValidation
    include IValidation
    def validate
      puts "Validating driver license..."
    end
  end

  class PersonalDocumentValidation
    include IValidation
    def validate
      puts "Validating personal document..."
    end
  end

  class CustomerRegistration
    def initialize(strategy)
      @strategy = strategy
    end

    def register
      puts "Registering customer..."
      @strategy.validate
      puts "Customer registered successfully!"
    end
  end
end
