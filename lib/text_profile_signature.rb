=begin
Text Profile Signature calculates a fuzzy hash of textual fields for Deduplication.
Copyright (C) 2016  Hamed Ramezanian Nik

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end

require 'digest'
require 'unicode'

class TextProfileSignature
  VERSION = "0.0.1" unless defined? TextProfileSignature::VERSION
  
  def initialize(options={})
    options[:min_token_length] ||= 2
    options[:quant_rate] ||= 0.01
    
    @options = options
  end
  
  def generate_sign(text)
    # remove all characters except letters and digits, 
    # and bring all characters to lower case
    # split the text into tokens (all consecutive non-whitespace characters)
    # discard tokens equal or shorter than MIN_TOKEN_LEN (default 2 characters)
    current_token = String.new
    max_freq = 0
    tokens = {}
    text.each_char do |character|
      if character =~ /[[:alnum:]]/
        current_token << Unicode::downcase(character)
      else
        if current_token.length > 0
          if current_token.length > @options[:min_token_length]
            # Add it
            tok = tokens[current_token]
            unless tok
              tok = {count: 0, term: current_token}
              tokens[current_token] = tok
            end
            tok[:count] += 1
            max_freq = tok[:count] if tok[:count] > max_freq
          end
          current_token = String.new
        end
      end
    end
    
    # Check the last token
    if current_token.length > @options[:min_token_length]
      # Add it
      tok = tokens[current_token]
      unless tok
        tok = {count: 0, term: current_token}
        tokens[current_token] = tok
      end
      tok[:count] += 1
      max_freq = tok[:count] if tok[:count] > max_freq
    end
    
    # calculate the QUANT value
    quant = (max_freq * @options[:quant_rate]).round
    
    if quant < 2
      if max_freq > 1
        quant = 2
      else
        quant = 1
      end
    end
    
    # round down the counts of tokens to the nearest multiple of QUANT
    # tokens, which frequency after quantization falls below QUANT, are discarded
    quantized_tokens = tokens.values.inject([]) do |memo, item|
      # round down to the nearest QUANT
      item[:count] = (item[:count] / quant) * quant
      
      # discard the frequencies below the QUANT
      memo.push(item) if item[:count] >= quant
      
      memo
    end
    
    # sort the list of tokens by decreasing frequency
    profile = quantized_tokens.sort {|x, y| y[:count] <=> x[:count]}

    # create a list of tokens and their quantized frequency, 
    # separated by spaces, in the order of decreasing frequency
    quantized_frequency_str = profile.map do |a|
      "#{a[:term]} #{a[:count]}"
    end.join('\n')
    
    Digest::MD5.hexdigest(quantized_frequency_str)
  end
end
