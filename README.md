# Text Profile Signature
[![Gem Version](https://badge.fury.io/rb/text_profile_signature.svg)](https://badge.fury.io/rb/text_profile_signature)

Text Profile Signature calculates a fuzzy hash of textual fields for Deduplication. It's the port of [TextProfileSignature](https://wiki.apache.org/solr/TextProfileSignature) which is written in Java.

## Installation

### RubyGems

Add this to the Gemfile:

    gem 'text_profile_signature'

or install it directly:

    gem install text_profile_signature

### Install from Git

Add the following in the Gemfile:

    gem 'text_profile_signature', :git => 'https://github.com/iCEAGE/text_profile_signature.git'


## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'text_profile_signature'

opts = {
  :min_token_length => 2, # Default to 2
  :quant_rate => 0.01 # Default to 0.01
}

text_profile_signature_instance = TextProfileSignature.new(opts)

text = <<-STR
Liberty, in philosophy, involves free will as contrasted with determinism.[1] In politics, liberty consists of the social and political freedoms enjoyed by all citizens.[2] In theology, liberty is freedom from the bondage of sin.[3] Generally, liberty seems to be distinct from freedom in that freedom concerns itself primarily, if not exclusively, with the ability to do as one wills and what one has the power to do; whereas liberty also takes into account the rights of all involved. As such, liberty can be thought of as freedom limited by rights, and therefore cannot be abused.
STR

sign = text_profile_signature_instance.generate_sign(text)

puts sign

```

## Documentation for options

|       Name       |  Type |                                     Description                                    | Default value |
|:----------------:|:-----:|:----------------------------------------------------------------------------------:|---------------|
| min_token_length |  int  | The minimum token length to consider                                               | 2             |
|    quant_rate    | float | When multiplied by the maximum token frequency, this determines count quantization | 0.01          |
