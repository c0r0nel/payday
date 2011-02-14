module Payday
  # Represents a line item in an invoice.
  #
  # quantity and price are written to be pretty picky, primarily because if we're not picky about what values are set to
  # them your invoice math could get pretty messed up. It's recommended that both values be set to BigDecimal values.
  # Otherwise, we'll do our best to convert the set values to a BigDecimal.
  class LineItem
    attr_accessor :description, :quantity, :price
    
    def initialize(options = {})
      self.quantity = options[:quantity] || "1"
      self.price = options[:price] || "0.00"
      self.description = options[:description] || ""
    end
    
    def quantity=(value)
      @quantity = BigDecimal.new(value.to_s)
    end
    
    def price=(value)
      @price = BigDecimal.new(value.to_s)
    end
    
    # Returns the total amount for this line item, or price * quantity
    def amount
      price * quantity
    end
  end
end