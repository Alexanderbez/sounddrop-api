# sounddrop-api

A Sinatra RESTful API that wraps around the sounddrop gem exposing exposing endpoints that return Soundcloud track and audio information.

## API

There is only one route:

- POST @ `/api/drop` which takes a JSON payload in the form of

```json
{"url": "https://soundcloud.com/electro/chomstars-granulation"}
```

which returns:

```json
{
  "title":"Chomstars - Granulation",
  "genre":"Progressive Electro",
  "media_url":"https://ec-media.soundcloud.com/iPcbrdyxlmPu.128.mp3?f10880d39085a94a0418a7ef69b03d522cd6dfee9399eeb9a522039c6bf8bb3a90d7dd9fb98e5e5c725fce466f6e4590397cc6b6ef458c4866ff9c4f9e13e83eedee6b8831&AWSAccessKeyId=AKIAJNIGGLK7XA7YZSNQ&Expires=1420405607&Signature=6I1jKQz6bOv%2BOyJQvP%2BSobNEp48%3D"
}
```

There is also a UI providing similar functionality.

To start the app:

```ruby
$ SC_CLIENT_ID=YOUR_SC_CLIENT_ID SC_CLIENT_SECRET=YOUR_SC_CLIENT_SECRET bundle exec thin -R config.ru start
```

Visit `http://lvh.me:3000`

## Contributing

1. Fork it ( https://github.com/Alexanderbez/sounddrop-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
