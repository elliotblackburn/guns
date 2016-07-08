# Guns

This application scrapes a website for recent gun crime in America. It'll then post it to the provided twitter account. Please put an end to guns and an end to the violence.

This is the code behind [@USGunIncidents](https://twitter.com/USGunIncidents). If you want to help make it more efficient or robust then checkout the contributing guide.

## Usage

Option flags:

* `-k` || `--key` - Twitter key
* `-s` || `--secret` - Twitter secret
* `-t` || `--token` - Twitter token
* `-q` || `--token_secret` - Twitter token secret
* `-r` || `--raygun` - Raygun API key

Example:

`guns -k KEY -s SECRET -t TOKEN -q TOKEN_SECRET -r RAYGUN_KEY`

## Development

Looking to contribute? That's great! Project setup is quite straight forward.

* `bundle install` to resolve dependencies
* `rake install` to install the current source.

If you'd rather run without installing then use something like below to run the application `ruby -Ilib guns ...`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BlueHatbRit/guns.

## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Sponsors

<img src="https://bluehatbrit.github.io/guns/raygun-logo.png" width="200">

[Error and Crash Reporting](https://raygun.com/products/crash-reporting) for this project is provided by Raygun!
