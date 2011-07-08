require "test/unit"
require 'lcd_number_printer'

class TestLCDNumberPrinter < Test::Unit::TestCase
  
  def setup
    @printer = LCDNumberPrinter.new
  end


  LCD_NUMBER_LINES = [[" - ", "| |", "   ", "| |", " - "],
                      ["   ", "  |", "   ", "  |", "   "],
                      [" - ", "  |", " - ", "|  ", " - "],
                      [" - ", "  |", " - ", "  |", " - "],
                      ["   ", "| |", " - ", "  |", "   "],
                      [" - ", "|  ", " - ", "  |", " - "],
                      [" - ", "|  ", " - ", "| |", " - "],
                      [" - ", "  |", "   ", "  |", "   "],
                      [" - ", "| |", " - ", "| |", " - "],
                      [" - ", "| |", " - ", "  |", " - "]]

  def test_get_single_lcd_number_string
    LCD_NUMBER_LINES.size.times do |i|
      assert_equal(make_single_lcd_number(LCD_NUMBER_LINES[i]), @printer.display(i))
    end
  end

  def test_get_single_lcd_number_string_with_size_3
    LCD_NUMBER_LINES.size.times do |i|
      assert_equal(make_single_lcd_number(LCD_NUMBER_LINES[i]), @printer.display(i))
    end
  end

  def test_get_multi_lcd_numbers_string
    target_number = "01234567890"
    lcd_lines = ""
    5.times do |line_number|
      lcd_line = ""
      target_number.to_s.each_byte do |c|
        lcd_line += LCD_NUMBER_LINES[c.chr.to_i][line_number]
        lcd_line += " "
      end
      lcd_line[-1] = "\n".first
      lcd_lines += lcd_line
    end
    assert_equal(lcd_lines, @printer.display(target_number))
  end

  private
  
  def make_single_lcd_number(lines)
    lines.join("\n") + "\n"
  end
end