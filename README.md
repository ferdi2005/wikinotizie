# Wikinotizie
Con questa gem è possibile effettuare il parsing della data di un articolo di Wikinotizie, interpretando il contenuto dei consueti template.
## Utilizzo
Una volta ottenuto il contenuto dell'articolo attraverso una cosa del genere,u sando per esempio la gem [mediawiki-ruby-api](https://github.com/wikimedia/mediawiki-ruby-api):
```
  require 'mediawiki_api'
  client = MediawikiApi::Client.new 'https://it.wikinews.org/w/api.php'
  content = client.query(prop: :revisions, rvprop: :content, titles: titolo_articolo, rvlimit: 1)["query"]["pages"]["#{pubblicato["pageid"]}"]["revisions"][0]["*"]
```
è possibile poi fare
```
content = Wikinotizie.parse(content)
```
Si otterrà dunque una array contente: il contenuto dell'articolo (content), l'intero match della regex, la data, il giorno, la data come oggetto DateTime della gem date (utilizzabile per esempio per un ordinamernto), la variabile with_luogo true o false e se with_luogo è true, il luogo dell'articolo così come inserito su Wikinotizie.
```
content = [content, match, data, giorno, @rubydate, with_luogo, luogo] # luogo solo se with_luogo è true
```

Nel caso in cui la gem non riesca ad effettuare il parsing, verrà restituito solamente false.

## Contributi
Ogni contributo è ben accetto!