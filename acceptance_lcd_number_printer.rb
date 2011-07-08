require "test/unit"
require 'lcd_number_printer'

class TestLCDNumberPrinter < Test::Unit::TestCase
  
  def setup
    @printer = LCDNumberPrinter.new
  end

  def test_should_be_able_to_all_numbers_at_default_size
    
    input = "01"#23456789"
    expected_output = <<END
 -     
| |   |
       
| |   |
 -     
END
    actual_output = @printer.display(input)
    assert_equal(expected_output, actual_output ,"expected \n#{expected_output.gsub(" ",":")}\nbut was\n\n#{actual_output.gsub(" ",":")}")
    
  end
  
    def test_should_be_able_to_all_numbers_at_defined_size

      input = "01"#23456789"
      expected_output = <<END
 --      
|  |     |
         
|  |    |
 --      
END
      actual_output = @printer.display(input, :size => 2)
      assert_equal(expected_output, actual_output ,"expected \n#{expected_output.gsub(" ",":")}\nbut was\n\n#{actual_output.gsub(" ",":")}")

    end
  
end