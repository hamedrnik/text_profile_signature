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

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'test_helper'

class TextProfileSignatureGeneratorTest < TextProfileSignatureTest
  def setup
    @text_profile_signature = TextProfileSignature.new
  end
  
  def test_en_lang
    page = get_wikipedia_article("en")
    sign = @text_profile_signature.generate_sign(page[:article])
    assert_equal sign, page[:signature]
  end
  
  def test_de_lang
    page = get_wikipedia_article("de")
    sign = @text_profile_signature.generate_sign(page[:article])
    assert_equal sign, page[:signature]
  end
  
  def test_es_lang
    page = get_wikipedia_article("es")
    sign = @text_profile_signature.generate_sign(page[:article])
    assert_equal sign, page[:signature]
  end
  
  def test_fr_lang
    page = get_wikipedia_article("fr")
    sign = @text_profile_signature.generate_sign(page[:article])
    assert_equal sign, page[:signature]
  end
  
  def test_it_lang
    page = get_wikipedia_article("it")
    sign = @text_profile_signature.generate_sign(page[:article])
    assert_equal sign, page[:signature]
  end
  
  def test_pt_lang
    page = get_wikipedia_article("pt")
    sign = @text_profile_signature.generate_sign(page[:article])
    assert_equal sign, page[:signature]
  end
end
