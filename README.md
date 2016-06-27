# Guns

This application scrapes a website for recent gun crime in America. It'll then post it to the provided twitter account. Please put an end to guns and an end to the violence.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guns'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guns

## Usage

Option flags:

* `-k` || `--key` - Twitter key
* `-s` || `--secret` - Twitter secret
* `-t` || `--token` - Twitter token
* `-q` || `--token_secret` - Twitter token secret

Example:

`ruby -Ilib exe/guns -k KEY -s SECRET -t TOKEN -q TOKEN_SECRET`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BlueHatbRit/guns.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
