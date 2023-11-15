class Calculator
    def self.remaining(total_budget, accommodation, transportation, meal, other)
        total_budget - accommodation - transportation - meal - other
    end
end