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

require File.expand_path('../../lib/text_profile_signature', __FILE__)

require 'minitest/autorun'
require 'yaml'

class TextProfileSignatureTest < MiniTest::Test
  def get_wikipedia_article(lang)
    path = File.expand_path("../fixtures/liberty_article_from_#{lang}_wikipedia.yaml", __FILE__)
    YAML.load_file(path)
  end
end
