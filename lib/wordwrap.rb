class InvalidParameter < Exception
end

class Wordwrap
  def initialize(wrapcol)
    raise InvalidParameter, "parameter must be a Fixnum" unless wrapcol.class == Fixnum
    @wrapcol = wrapcol
  end

  def wrap(text)
    raise InvalidParameter, "parameter must be a String" unless text.class == String
    col = 0
    text.each_char.inject("") do |str,char|
      col += 1
      str << char
      if col > @wrapcol
        lastspace = str.rindex ' '
        lastspace = @wrapcol unless lastspace
        overhang = str[lastspace..-1].strip
        str[lastspace..-1] = ""
        str = str.rstrip + "\n" + overhang
        col = overhang.length
      end
      str
    end
  end
end
