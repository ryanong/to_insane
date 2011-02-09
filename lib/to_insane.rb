# ToInsane
# Distributed under the MIT license as included with this plugin.
#

INSANECHARACTERS = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ-._~+[]|$!*(),{}^<>#%;?:@&='

class String
  # Converts a string to a base x integer using y character set.
  def from_insane(base_val = 58, alpha = INSANECHARACTERS)
    base_val = alpha.size if base_val == :max
    if base_val == :url_safe
      base_val = 63
      alpha = INSANECHARACTERS
    end
    raise ArgumentError, "Base Value is not valid. Integer, :max, :url_safe" unless base_val.kind_of? Integer
    raise ArgumentError, "Base size is too large for given character set. Please use a Base value larger than 1 and less than #{alpha.length}" if base_val > alpha.length or base_val <= 1    
    raise ArgumentError, "Character set needs to be larger than 0" if alpha.size <= 0
    raise ArgumentError, "Character set has duplicate characters" if alpha.size != alpha.split(//).uniq.size
    int_val = 0
    char_ref = alpha[0..base_val]
    self.reverse.split(//).each_with_index do |char,index|
      raise ArgumentError, "Character #{char} at index #{index} is not a valid character for to_insane Base #{base_val} String." unless char_index = char_ref.index(char)
      int_val += (char_index)*(base_val**(index))
    end
    int_val
  end
end

class Integer
  # Converts a base10 integer to a base x string.
  def to_insane(base_val = 58, alpha = INSANECHARACTERS)
    base_val = alpha.size if base_val == :max
    if base_val == :url_safe
      base_val = 63
      alpha = INSANECHARACTERS
    end
    raise ArgumentError, "Base Value is not valid. Integer, :max, :url_safe" unless base_val.kind_of? Integer
    raise ArgumentError, "Base size is too large for given character set. Please use a Base value larger than 1 and less than #{alpha.length}" if base_val > alpha.length or base_val <= 2
    raise ArgumentError, "Character set needs to be larger than 0" if alpha.size <= 0
    raise ArgumentError, "Character set has duplicate characters" if alpha.size != alpha.split(//).uniq.size
    char_ref = alpha[0..base_val]
    insane_val = ''
    int_val = self 
    while(int_val >= base_val)
      mod = int_val % base_val
      insane_val = char_ref[mod,1] + insane_val
      int_val = (int_val - mod)/base_val
    end
    char_ref[int_val,1] + insane_val
  end
end

