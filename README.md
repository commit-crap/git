# Commit-Crap
Secrets commit, when you are angry with something and can't tell to anybody.

### Dependências
Para rodar a aplicação você precisa instalar os seguintes itens:

* [Rails]
* [RVM]

### Rodando a aplicação
```sh
$ git clone https://github.com/commit-crap/commit-crap.git
$ cd commit-crap
$ gem install bundler # se ainda não tiver instalado a gem
$ bundle install
$ bundle exec rake db:migrate
$ bundle exec rails s
```
Sua aplicação irá rodar em [localhost].

### Observações
Para montar esta documentação foi utilizada a ferramenta [Dillinger].

Licença
----
MIT

[dillinger]:http://dillinger.io
[localhost]:http://localhost:3000
[rvm]:https://rvm.io
[rails]:http://rubyonrails.org/download/
