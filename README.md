# each_with_rank

Rank iterator for Enumerable

## Installation

Add this line to your application's Gemfile:

    gem 'each_with_rank'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install each_with_rank

## Usage

``` ruby
array = []
[100, 100, 300].each_with_rank do |number, rank|
  array << [number, rank]
end
array # => [[100, 1], [100, 1], [300, 3]]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
