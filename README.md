# Strategy Design Pattern Example - in Ruby!
Design patterns are great to exercise OO principles. This is particularly useful when you are learning a new programming language. 

Although this project may be limited, it highlights the benefit of using the Strategy DP in a real-world scenario (simplified here, of course).

> To learn more about the Strategy Design Pattern, check out also [the Java version](https://github.com/gabrielcostasilva/dp-strategy.git).

> You can also checkout another [Ruby example](https://github.com/gabrielcostasilva/dp-strategy-ruby-billing.git). 

## Project Overview
The [`Strategy` module](./lib/strategy.rb) holds a module and three classes. The `IValidation` module sets the _contract_ (`validate()` method) for the strategy classes. In this example, it does not have a default implementation.

`DriverLicenseValidation` and `PersonalDocumentValidation` implement the `IValidation` module. They are responsible for validating a driver's license and a personal document, respectively. Therefore, they implement specific algorithms and processes to validate the documents through the `validate()` method. 

Finally, the `CustomerRegistration` class uses a particular implementation to validating a document (2). The implementation is set at runtime via _constructor_ (1), as the snippet below shows:

```ruby
(...)
  class CustomerRegistration
    def initialize(strategy) #1
      @strategy = strategy
    end

    def register
      puts "Registering customer..."
      @strategy.validate #2
      puts "Customer registered successfully!"
    end
  end
(...)
```

The [unit test](./spec/strategy_spec.rb) shows the Strategy usage in practice. But, the snippet below exemplifies the process:

```ruby
(...)
    let(:driver_license_validation) { Strategy::DriverLicenseValidation.new } #1
(...)
    it "registers a customer with driver license validation" do
      registration = Strategy::CustomerRegistration.new(driver_license_validation) #2
      expect { registration.register }.to output(
        "Registering customer...\nValidating driver license...\nCustomer registered successfully!\n"
      ).to_stdout #3
    end
(...)    
```

1. Instantiates a validation _strategy_
2. Sets the validation _strategy_ to be used
3. Calls the validation
