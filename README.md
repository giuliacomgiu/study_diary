# Diário de Estudos

Este Diário de Estudos é uma aplicação proposta pelo treinamento da Code Camp.

## Funcionalidades

- Cadastrar, editar ou deletar um item de estudo
- Marcar como concluído
- Definir um prazo
- Comentar em um item de estudo
- Apagar o comentário
- Cadastrar, editar e remover categorias
- Associar categorias a itens de estudo
- Associar tipos a itens de estudo
- Buscar um tópico de estudo
- Usuário precisa estar autenticado exceto para as actions index e show

A autenticação é feita através da gem Devise. Ela foi escolhida por ser bem estabelecida e ter atualizações frequentes. Fazer um sistema de login realmente seguro é uma atividade relativamente complexa, e considerando o tempo disponível para o projeto, não me pareceu uma alternativa adequada.

A gem bootstrap foi utilizada para adicionar ícones e para customizar o front.

## Especificações da aplicação:

- Ruby 2.7.2

- Rails 6.0.3.4

- [Devise](https://github.com/heartcombo/devise)

- [Bootstrap](https://github.com/twbs/bootstrap-sass)

- SQLite 3
