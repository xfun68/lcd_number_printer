class LCDNumberPrinter;

  DIGIT_DISPLAYED_MAP =  [[" - ", "| |", "   ", "| |", " - "],
                          ["   ", "  |", "   ", "  |", "   "]];



  def display(number,options = {});
    size = options[:size]? options[:size] : 1
    
    result = ""
     5.times do |section|
     number.to_s.each_byte do |c|
        result += DIGIT_DISPLAYED_MAP[c.chr.to_i][section][0].chr;
        size.times {result += DIGIT_DISPLAYED_MAP[c.chr.to_i][section][1].chr};
        result += DIGIT_DISPLAYED_MAP[c.chr.to_i][section][2].chr;
        result += " "
      end
      result[-1] = "\n".first
     end
    # # print result
    result
  end
end
