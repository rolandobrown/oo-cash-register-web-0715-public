#require 'pry'

class CashRegister
  attr_reader :discount, :items_list, :prices_list  # => nil
  attr_accessor :total                              # => nil

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items_list = []
    @prices_list = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times { @items_list << title }
    quantity.times { @prices_list << price }
  end

  def apply_discount
  case
    when @discount==0 then "There is no discount to apply."
    else
        @total *= (100-@discount.to_f)/100
        @total = @total.round
        "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items_list
  end

  def void_last_transaction
    @total -= @prices_list.pop
  end

end

# binding.pry
