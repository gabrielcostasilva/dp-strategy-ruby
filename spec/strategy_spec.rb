# frozen_string_literal: true

require "spec_helper"

require "strategy"

RSpec.describe Strategy do
  describe Strategy::DriverLicenseValidation do
    it "validates driver license" do
      validation = Strategy::DriverLicenseValidation.new
      expect { validation.validate }.to output("Validating driver license...\n").to_stdout
    end
  end

  describe Strategy::PersonalDocumentValidation do
    it "validates personal document" do
      validation = Strategy::PersonalDocumentValidation.new
      expect { validation.validate }.to output("Validating personal document...\n").to_stdout
    end
  end

  describe Strategy::CustomerRegistration do
    let(:driver_license_validation) { Strategy::DriverLicenseValidation.new }
    let(:personal_document_validation) { Strategy::PersonalDocumentValidation.new }

    it "registers a customer with driver license validation" do
      registration = Strategy::CustomerRegistration.new(driver_license_validation)
      expect { registration.register }.to output(
        "Registering customer...\nValidating driver license...\nCustomer registered successfully!\n"
      ).to_stdout
    end

    it "registers a customer with personal document validation" do
      registration = Strategy::CustomerRegistration.new(personal_document_validation)
      expect { registration.register }.to output(
        "Registering customer...\nValidating personal document...\nCustomer registered successfully!\n"
      ).to_stdout
    end
  end
end
